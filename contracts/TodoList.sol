pragma solidity >=0.4.22 <0.9.0;

contract TodoList {
    //keep track of number of TodoList
    uint256 public taskCount = 0; //state variable  public allows to read it

    //model a task
    struct Task {
        uint256 id; //integer that can't be negative
        string content; //text
        bool completed; //for check list in todo lisst
    }

    //put task in storage
    //key value pair in mapping Task is struct above and tasks is mapping name
    //  task = await todoList.tasks(1) in console post compling to see the first task in our contract
    mapping(uint256 => Task) public tasks;

    // event
    event TaskCreated(uint256 id, string content, bool completed);

    //add some task to the list when ever smart contract is deployed. So we use constructor
    constructor() public {
        // default task
        createTask("Check out github.com/justKishore");
    }

    // put Task struct inside task mapping
    function createTask(string memory _content) public {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false); //id = taskCount, content = _content, completed = false
        emit TaskCreated(taskCount, _content, false);
    }
}
