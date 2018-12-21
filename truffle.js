module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  solc: {
    optimizer: {
      enabled: true,
        runs: 200
    }
  },

  networks: {
    develop: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*"
    },
    geth: {
      host: "127.0.0.1",
      port: 8545,
      from: "0xb5D64ebF61C611641C1065438233b91f6e4E37CB", 
      gas:4721975,
      network_id: "*"
    },
    ganache: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    }
  }
};
