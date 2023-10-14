const list = document.querySelectorAll('.list');
const section = document.querySelectorAll("section");
const toggleClick = document.querySelector(".togglebox");
const drop_down = document.querySelector(".drop-down");
const logo = document.querySelector(".logo");
const welcome = document.querySelector(".welcome");
const para = document.querySelector(".para");
const explore_btn = document.querySelector(".explore-btn");
const home_content = document.querySelector(".container-home");
const blurred = document.querySelector(".blurry");
const ul = document.querySelector(".ul");

function activeLink() {
   list.forEach((item) => item.classList.remove('active'));
   this.classList.add('active')

   section.forEach((item) => item.classList.remove('sections'));
   this.classList.add('sections');
}
list.forEach((item) => item.addEventListener('click', activeLink));

toggleClick.addEventListener('click', () => {
   toggleClick.classList.toggle('active');
   drop_down.classList.toggle('active');
   logo.classList.toggle('active');
   home_content.classList.toggle('active');
   blurred.classList.toggle('active');
   welcome.classList.toggle('active');
   para.classList.toggle('active');
   explore_btn.classList.toggle('active');
   ul.classList.toggle('active');
})
