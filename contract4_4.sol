pragma solidity ^0.4.11;


/*
* Написать код, который будет показывать сообщение в блокчейне за определенные деньги и переводить их на счет
*/
contract Contract45 {

    string public text;
    uint public timestamp;
    address public creator;

    function Contract45() public {
        creator = msg.sender;
        text = "Contract created";
    }

    function() payable public {
    }

    function showMessage(string txt) payable public returns (string) {
        require(msg.value > 1 * 0.1 ether);
        require(now > timestamp);

        bool transferResult = send(creator, msg.value);
        if(transferResult) {
            timestamp = now + 5 minutes;
            text = txt;
            return text;
        }
    }

    function send(address to, uint value) internal returns (bool) {
        return to.send(value);
    }
}



