//pragma solidity 0.8.18;

contract WithdrawMe {
    error BadWithdrawl();

    event success();
    event fail();

    constructo(bytes32 secretHash) payable {
      s_secretHash = secretHash;
      }

    function withdraw(string memory password) external payable {
        if(keccak256(abi.encodePacked(password)) == s_secretHash){
            (bool sent, ) = msg.sender.call{value: address(this).balance}("");
            if(!sent){
            revert BadWithdrawl();
        }
           emit success();
    } else {
        emit fail();
    }
    }
    function balance() external view returns(uint256){
        return address(this).balance;
    }
}
