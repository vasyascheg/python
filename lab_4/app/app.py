from flask import Flask, render_template, request, url_for, make_response, session, redirect, flash
from flask_login import LoginManager, UserMixin, login_user, logout_user, login_required
from mysql_db import MySQL
import mysql.connector as connector

login_manager = LoginManager()

app = Flask(__name__)
application = app

app.config.from_pyfile('config.py')

mysql = MySQL(app)

login_manager.init_app(app)
login_manager.login_view = 'login'
login_manager.login_message = 'Для доступа необходимо пройти процедуру аутентификации.'
login_manager.login_message_category = 'warning'


class User(UserMixin):
    def __init__(self, user_id, login):
        super().__init__()
        self.id = user_id
        self.login = login


@login_manager.user_loader
def load_user(user_id):
    cursor = mysql.connection.cursor(named_tuple=True)
    cursor.execute('SELECT * FROM users WHERE id = %s;', (user_id,))
    db_user = cursor.fetchone()
    cursor.close()
    if db_user:
        return User(user_id=db_user.id, login=db_user.login)
    return None


def load_roles():
    cursor = mysql.connection.cursor(named_tuple=True)
    cursor.execute('SELECT id, name FROM roles;')
    roles = cursor.fetchall()
    cursor.close()
    return roles


@app.route('/')
def index():
    return render_template('index.html')


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        login = request.form.get('login')
        password = request.form.get('password')
        remember_me = request.form.get('remember_me') == 'on'
        if login and password:
            cursor = mysql.connection.cursor(named_tuple=True)
            cursor.execute(
                'SELECT * FROM users WHERE login = %s AND password_hash = SHA2(%s, 256);', (login, password))
            db_user = cursor.fetchone()
            cursor.close()
            if db_user:
                user = User(user_id=db_user.id, login=db_user.login)
                login_user(user, remember=remember_me)

                flash('Вы успешно аутентифицированы', 'success')

                next = request.args.get('next')

                return redirect(next or url_for('index'))
        flash('Введены неверные логин и/или пароль', 'danger')
    return render_template('login.html')


@app.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('index'))


@app.route('/users')
def users():
    cursor = mysql.connection.cursor(named_tuple=True)
    cursor.execute(
        'SELECT users.*, roles.name AS role_name FROM users LEFT OUTER JOIN roles ON users.role_id=roles.id;')
    users = cursor.fetchall()
    cursor.close()
    return render_template('users/index.html', users=users)


@app.route('/users/<int:user_id>')
@login_required
def show(user_id):
    cursor = mysql.connection.cursor(named_tuple=True)
    cursor.execute('SELECT * FROM users WHERE id = %s;', (user_id,))
    user = cursor.fetchone()
    cursor.execute('SELECT * FROM roles WHERE id = %s;', (user.role_id,))
    role = cursor.fetchone()
    cursor.close()
    return render_template('users/show.html', user=user, role=role)


@app.route('/users/new')
@login_required
def new():
    return render_template('users/new.html', user={}, roles=load_roles())


@app.route('/users/<int:user_id>/edit')
@login_required
def edit(user_id):
    cursor = mysql.connection.cursor(named_tuple=True)
    cursor.execute('SELECT * FROM users WHERE id = %s;', (user_id,))
    user = cursor.fetchone()
    cursor.close()
    return render_template('users/edit.html', user=user, roles=load_roles())


@app.route('/users/create', methods=['POST'])
@login_required
def create():
    login = request.form.get('login') or None
    password = request.form.get('password') or None
    first_name = request.form.get('first_name') or None
    last_name = request.form.get('last_name') or None
    middle_name = request.form.get('middle_name') or None
    try:
        role_id = int(request.form.get('role_id'))
    except ValueError:
        role_id = None
    query = '''
        INSERT INTO users (login, password_hash, first_name, last_name, middle_name, role_id)
        VALUES (%s, SHA2(%s, 256), %s, %s, %s, %s);
    '''
    cursor = mysql.connection.cursor(named_tuple=True)
    try:
        cursor.execute(query, (login, password, first_name, last_name, middle_name, role_id))
    except connector.errors.DatabaseError:
        flash('Введены некорректные данные, ошибка сохранения', 'danger')
        
        user = {
            'login': login,
            'password': password,
            'first_name': first_name,
            'last_name': last_name,
            'middle_name': middle_name,
            'role_id': role_id
        }
        return render_template('users/new.html', user=user, roles=load_roles())
    mysql.connection.commit()
    cursor.close()
    flash(f'Пользователь {login} был успешно создан.', 'success')
    return redirect(url_for('users'))


@app.route('/users/<int:user_id>/update', methods=['POST'])
@login_required
def update(user_id):
    login = request.form.get('login') or None
    first_name = request.form.get('first_name') or None
    last_name = request.form.get('last_name') or None
    middle_name = request.form.get('middle_name') or None
    role_id = request.form.get('role_id') or None
    query = '''
        UPDATE users SET login=%s, first_name=%s, last_name=%s, middle_name=%s, role_id=%s
        WHERE id=%s;
    '''
    cursor = mysql.connection.cursor(named_tuple=True)
    try:
        cursor.execute(query, (login, first_name, last_name, middle_name, role_id, user_id))
    except connector.errors.DatabaseError:
        flash('Введены некорректные данные, ошибка сохранения', 'danger')
        user = {
            'id': user_id,
            'login': login,
            'first_name': first_name,
            'last_name': last_name,
            'middle_name': middle_name,
            'role_id': role_id
        }
        return render_template('users/edit.html', user=user, roles=load_roles())
    mysql.connection.commit()
    cursor.close()
    flash(f'Пользователь {login} был успешно обновлён.', 'success')
    return redirect(url_for('users'))


@app.route('/users/<int:user_id>/delete', methods=['POST'])
@login_required
def delete(user_id):
    with mysql.connection.cursor(named_tuple=True) as cursor:
        try:
            cursor.execute('DELETE FROM users WHERE id = %s;', (user_id,))
        except connector.errors.DatabaseError:
            flash('Не удалось удалить запись.', 'danger')
            return redirect(url_for('users'))
        mysql.connection.commit()
        flash('Запись была успешно удалена.', 'success')
    return redirect(url_for('users'))
