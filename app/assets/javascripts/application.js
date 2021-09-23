// require rails-ujs
// require turbolinks
//= require_tree

const toggleContainer = () => {
  const togglePaneButton = document.querySelectorAll('.toggle-side-pane')
  const sidePane = document.querySelector('.side-pane')
  const sidePaneContent = document.querySelector('.side-pane-content')

  sidePane.classList.toggle('-translate-x-full')
  sidePane.classList.toggle('translate-x-0')
  sidePaneContent.classList.toggle('-translate-x-full')
  sidePaneContent.classList.toggle('translate-x-0')
}
