var Lib = artifacts.require("./Lib.sol");
//var Organization = artifacts.require("./Organization.sol");
//var Person = artifacts.require("./Person.sol");
var PHR = artifacts.require("./PHR.sol");

module.exports = function(deployer) {
  deployer.deploy(Lib);

//  deployer.link(Lib, Organization);
//  deployer.deploy(Organization);

//  deployer.link(Lib, Person);
//  deployer.deploy(Person);

  deployer.link(Lib, PHR);
//  deployer.link(Organization, PHR);
//  deployer.link(Person, PHR);
  deployer.deploy(PHR);

};
