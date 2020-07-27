import React from "react";
import { connect } from "react-redux";
import { fetchUsers } from "../../actions/user_actions";
// import UserIndexItem from "./user_index_item";
class UserIndex extends React.Component {
    componentDidMount() {
        //TODO
    }
    render() {
        const users = this.props.users.map(user => {
            return (
                <li key={user.id}>
                    <h1>{user.username}</h1>
                </li>
            );
        });
        return <ul className="user-index">{users}</ul>;
    }
}
const mapStateToProps = state => {
    return {
        //TODO
    };
};
const mapDispatchToProps = dispatch => {
    return {
        //TODO
    };
};
export default connect(
    mapStateToProps,
    mapDispatchToProps
)(UserIndex);