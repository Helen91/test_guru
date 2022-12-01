document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('#user_password_confirmation')

  if (control) { control.addEventListener('input', updateValue) }
})

function updateValue() {
  
  var password = document.querySelector('#user_password')
  var confirmation = document.querySelector('#user_password_confirmation')


  if (confirmation.value == "") {
    document.querySelector('.octicon-check-circle').classList.add('hide')
    document.querySelector('.octicon-circle-slash').classList.add('hide')
    return
  }

  if (password.value == confirmation.value) {
    document.querySelector('.octicon-check-circle').classList.remove('hide')
    document.querySelector('.octicon-circle-slash').classList.add('hide')
  } else {
    document.querySelector('.octicon-check-circle').classList.add('hide')
    document.querySelector('.octicon-circle-slash').classList.remove('hide')
  }
}