document.querySelector('#check').addEventListener('click', check)

function check() {

  const day = document.querySelector('#day').value
  if (day.toUpperCase() === "SATURDAY" || day.toUpperCase() === "SUNDAY") {
    console.log("weekend")
  } else if (day.toUpperCase() === "TUESDAY" || day.toUpperCase() === "THURSDAY") {
    console.log("class")
  }else {
    console.log("boring")
  }
}
