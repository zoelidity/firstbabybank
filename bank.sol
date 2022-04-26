// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; 
contract bankuchies{
    address public bankowner;
    string public bankname;
    mapping (address => uint256) public customerbalance;
    constructor () {
        bankowner = msg.sender;
    }
    function depositmoney () public payable{
        require(msg.value !=0, "you poor");
        customerbalance[msg.sender] += msg.value;

    }
    function renamebank (string memory _name) external {
        require(msg.sender == bankowner, "you not him");
        bankname = _name;

    }
    function withdrawmoney (address payable _to, uint256 _total) public {
        require (_total <= customerbalance[msg.sender], "you broke");
        _to.transfer (_total);

    }

    function custiesmoney () external view returns(uint256) {
        return customerbalance[msg.sender];

    }
    function getbankbalance () public view returns (uint256){
        require(msg.sender == bankowner);
        return address(this).balance;
    }
}
