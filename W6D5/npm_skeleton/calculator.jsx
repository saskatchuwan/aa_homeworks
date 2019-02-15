import React from 'react';

class Calculator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      result: 0,
      num1: '',
      num2: ''
    }

    this.setNum1 = this.setNum1.bind(this);
  }

  // your code here

  render() {
    const { num1, num2, result } = this.state;
    return (
      <div>
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} value={num1}/>
      </div>

    );
  }

  setNum1(e) {
    let num1;
    if (e.target.value) {
      num1 = parseInt(e.target.value);
    } else {
      num1 = '';
    }

    this.setState({ num1 });

  }


}

export default Calculator;