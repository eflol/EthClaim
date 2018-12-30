module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  networks: {
    ganache: {
      host: '127.0.0.1',
      port: 8552,
      network_id: '*'
    },
    geth: {
      host: '127.0.0.1',
      port: 8552,
      from: '0xF2B22BB0A44aaAF9e26BE04688d2534544440343',
      network_id: '*'
    }
  }
};
