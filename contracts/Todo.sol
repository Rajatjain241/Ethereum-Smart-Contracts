// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.14;

contract TODO {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public {
        todos.push(Todo({
            text: _text, 
            completed: false
        }));
    }

    function get(uint _index) public view returns (Todo memory) {
        return todos[_index];
    }

    function update(uint _index, string calldata _text) public {
        todos[_index].text = _text;
    }

    function toggleCompleted(uint _index) public {
        todos[_index].completed = !todos[_index].completed;
    }

}