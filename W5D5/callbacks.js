//setTimeOut is asynchronous because it schedules work to be done in the background
window.setTimeout(function () {
  console.log(alert('HAMMERTIME'));
}, 5000);

const hammerTime = function (time) {
  window.setTimeout(function () {
    alert(`${time} is hammertime!`);
  });
}

