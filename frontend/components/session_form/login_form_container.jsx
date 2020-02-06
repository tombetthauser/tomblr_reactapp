import { connect } from 'react-redux';
import React from 'react';
import { Link } from 'react-router-dom';
import { login } from '../../actions/session_actions';
import { requestUser } from '../../actions/user_actions'
import SessionForm from './session_form';
// import { selectUser } from '../../reducers/selectors'

const mapState = state => ({
    errors: state.errors.session,
    formType: 'login',
    navLink: <Link class="login-signup-link" to="/signup">sign up</Link>,
    // user: selectUser(state, state.session.id)
});

const mapDisp = dispatch => ({
    processForm: (user) => dispatch(login(user)),
    requestUser: (userId) => dispatch(requestUser(userId))
});

export default connect(mapState, mapDisp)(SessionForm);