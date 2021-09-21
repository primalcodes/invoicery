// require rails-ujs
// require turbolinks
//= require_tree

// console.log('I WAS LOADED')
// const togglePaneButton = document.querySelectorAll('.toggle-side-pane')
// console.log(togglePaneButton)
// const sidePane = document.querySelector('.side-pane')
// togglePaneButton.forEach((button) => {
//   button.addEventListener('click', () => {
//     console.log('clicked')
//     sidePane.removeClass('-translate-y-full')
//   })
// })

const toggleContainer = () => {
  const togglePaneButton = document.querySelectorAll('.toggle-side-pane')
  const sidePane = document.querySelector('.side-pane')
  const sidePaneContent = document.querySelector('.side-pane-content')

  sidePane.classList.toggle('-translate-x-full')
  sidePane.classList.toggle('translate-x-0')
  sidePaneContent.classList.toggle('-translate-x-full')
  sidePaneContent.classList.toggle('translate-x-0')
}
