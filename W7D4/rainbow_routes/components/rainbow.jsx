import React from 'react';
import {
  Route,
  Link,
  NavLink
} from 'react-router-dom';

import Red from './red';
import Green from './green';
import Blue from './blue';
import Violet from './violet';

class Rainbow extends React.Component {
  render() {
    return (
      <div>
        <h1>Rainbow Router!</h1>

          {/* <Link to='/red' >Red only</Link>
          <Link to='/red/yellow' >Add yellow to red</Link>
          <Link to='/red/orange' >Add orange to red</Link>
          <Link to='/green' >Green</Link>
          <Link to='/blue' >Blue only</Link>
          <Link to='/blue/indigo' >Add indigo to blue</Link>
          <Link to='/violet' >Violet</Link> */}

          
          <NavLink exact to='/red' >Red only</NavLink>
          <NavLink to='/red/yellow' >Add yellow to red</NavLink>
          <NavLink to='/red/orange' >Add orange to red</NavLink>
          <NavLink to='/green' >Green</NavLink>
          <NavLink exact to='/blue' >Blue only</NavLink>
          <NavLink to='/blue/indigo' >Add indigo to blue</NavLink>
          <NavLink to='/violet' >Violet</NavLink>

        <div id="rainbow">
          <Route path="/red" component={Red} />
          <Route path="/green" component={Green} />
          <Route path="/blue" component={Blue} />
          <Route path="/violet" component={Violet} />
        </div>
      </div>
    );
  }
};

export default Rainbow;
