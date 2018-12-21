pragma solidity ^0.4.2;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/PHR.sol";

contract TestPHR {

  function testInitialBalanceUsingDeployedContract() public {
    PHR meta = PHR(DeployedAddresses.PHR());

    uint expected = 10000;

    Assert.equal(meta.getMRLength("酒公 林家唱"), expected, "Owner should have 10000 PHR initially");
  }

  function testInitialBalanceWithNewPHR() public {
    PHR meta = new PHR();

    uint expected = 10000;

    Assert.equal(meta.getMRLength("酒公 林家唱"), expected, "Owner should have 10000 PHR initially");
  }

}
