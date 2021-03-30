from flask_login import current_user

ADMIN_ROLE_ID = 4
MODERATOR_ROLE_ID = 6
USER_ROLE_ID = 5

def is_admin():
    return current_user.role_id == ADMIN_ROLE_ID

def is_moderator():
    return current_user.role_id == MODERATOR_ROLE_ID

def is_user():
    return current_user.role_id == USER_ROLE_ID

class UsersPolicy:
    def __init__(self, record=None):
        self.record = record

    def edit(self):
        return is_admin() or is_moderator() 

    def show(self):
        return is_admin() or is_moderator() or is_user()

    def new(self):
        return is_admin()

    def delete(self):
        return is_admin()

