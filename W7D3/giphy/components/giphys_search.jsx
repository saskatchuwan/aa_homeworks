import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.component {
  constructor (props) {
    super(props);
    this.state = {
      searchTerm: ''
    }
  }

  render () {
    return (
      <form>
        <input type='text'></input>
        <button>Submit</button>
      </form> 
    )
  }
}