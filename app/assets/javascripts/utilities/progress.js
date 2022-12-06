document.addEventListener('turbolinks:load', function() {
  var progress = document.querySelector('progress')

  if (progress) {
    progress.value = progress.dataset["current"]
    progress.max = progress.dataset["count"]
  }
})