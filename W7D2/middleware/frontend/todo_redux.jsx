import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

//Phase 1

// const addLoggingtoDispatch = (store) => {
//   const storeDispatch = store.dispatch;

//   return function(action) {
//     console.log('State pre-dispatch: ',store.getState());
//     console.log('Action received: ', action);
//     storeDispatch(action);
//     console.log('State post-dispatch: ', store.getState());
//   };
// };

//Phase 2

// const addLoggingToDispatch = store => next => action => {
//   console.log('State pre-dispatch: ',store.getState());
//   console.log('Action received: ', action);
//   let result = next(action);
//   console.log('State post-dispatch: ', store.getState());
//   return result;
// };

// const applyMiddlewares = (store, ...middlewares) => {
//   let dispatch = store.dispatch;

//   middlewares.forEach((middleware) => {
//     dispatch = middleware(store)(dispatch);
//   });

//   return Object.assign({}, store, { dispatch });
// }



document.addEventListener('DOMContentLoaded', () => {

  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  //Phase 1
  // store.dispatch = addLoggingtoDispatch(store);

  //Phase 2
  // store = applyMiddlewares(store, addLoggingToDispatch);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
