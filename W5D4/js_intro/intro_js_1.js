function madLib(verb, adjective, noun) {
  let result = `We will ${verb.toUpperCase()} the ${adjective.toUpperCase()} ${noun.toUpperCase()}.`;
  console.log(result);
  return result;
}

function isSubstring(searchString, subString) {
  let arr = searchString.split(' ');

  if (arr.includes(subString)) {
    return true;
  } else {
    return false;
  }
}

function fizzBuzz(array) {
  let result = [];

  array.forEach(num => {
    if ((num % 15 !== 0) && (num % 3 === 0 || num % 5 === 0)) {
      result.push(num);
    }
  });

  console.log(result);
  return result;
}