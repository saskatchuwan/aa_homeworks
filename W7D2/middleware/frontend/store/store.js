import { createStore } from 'redux';
import rootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

//Phase 3
const addLoggingToDispatch = store => next => action => {
  console.log('State pre-dispatch: ',store.getState());
  console.log('Action received: ', action);
  let result = next(action);
  console.log('State post-dispatch: ', store.getState());
  return result;
};

//Bonus
const addMoreLoggingToDispatch = store => next => action => {
  console.log('second middleware start');
  console.log('2 State pre-dispatch: ',store.getState());
  console.log('2 Action received: ', action);
  let result = next(action);
  console.log('2 State post-dispatch: ', store.getState());
  console.log('second middleware end');
  return result;
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(rootReducer, preloadedState, applyMiddleware(addLoggingToDispatch, addMoreLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
}

export default configureStore;
