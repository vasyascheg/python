$('#delete-user-modal').on('show.bs.modal', function (event) {
    let url = event.relatedTarget.dataset.url;
    let form = this.querySelector('form');
    let userName = event.relatedTarget.closest('tr').querySelector('.user-name').textContent;
    form.action = url;
    this.querySelector('#user-name').textContent = userName;
  })
