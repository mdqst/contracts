---

# 📝 Smart Contracts Repository for Popular Blockchain Networks

Welcome to the **Smart Contracts Repository**! This repository contains a collection of smart contracts developed for some of the most widely-used blockchain networks. Each contract is tailored to the specifications of its respective network, providing developers with a wide range of examples to work with. Whether you're working on Ethereum, Binance Smart Chain, Solana, or other platforms, you'll find useful contract examples here.

## 🌐 Supported Networks

This repository includes smart contracts for the following blockchain networks:

- **Ethereum**
- **Linea**
- **Base**
- **Berachain**
- **Monad**

## 🛠️ Prerequisites

To work with the smart contracts in this repository, you'll need the following development tools:

- **Node.js** (v14 or higher)
- **Truffle** or **Hardhat** (for Ethereum, BSC, Polygon, etc.)
- **Solana CLI** (for Solana-specific smart contracts)
- **MetaMask** or other compatible wallets for testing
- **Remix IDE** (optional) for quick contract testing and deployment

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/mdqst/contracts.git
   cd contracts
   ```

2. Install the dependencies:

   - For EVM contracts:

     ```bash
     npm install
     ```

   - For Solana contracts:

     Make sure you have **Rust** and **Solana CLI** installed. Follow the [Solana installation guide](https://docs.solana.com/cli/install-solana-cli-tools) if needed.

## 🚀 Deployment

Each folder contains deployment guides for deploying the smart contracts on their respective networks.

### For EVM-Compatible Networks (Ethereum, BSC, Polygon, etc.):

You can use **Hardhat** or **Truffle** to deploy smart contracts:

1. **Deploy with Truffle**:

   ```bash
   truffle migrate --network <network_name>
   ```

2. **Deploy with Hardhat**:

   ```bash
   npx hardhat run scripts/deploy.js --network <network_name>
   ```

### For Solana:

1. **Build the contract**:

   ```bash
   cargo build-bpf
   ```

2. **Deploy the contract**:

   ```bash
   solana program deploy <program_file>
   ```

## 🔗 Testing

Each contract comes with a set of tests written using **Mocha/Chai** (for EVM) or **Rust tests** (for Solana). You can run the tests for EVM-compatible networks using:

```bash
npx hardhat test
```

For Solana, run:

```bash
cargo test
```

## 📝 License

This repository is licensed under the **MIT License**. Feel free to use, modify, and distribute the smart contracts within this repository for personal or commercial use.

## 🤝 Contributing

Contributions are welcome! If you'd like to add a contract for a new blockchain network or improve existing contracts, feel free to submit a pull request.

1. Fork the repository
2. Create a new branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request

## 📧 Contact

If you have any questions, feel free to reach out via email or create an issue in this repository.

---

Enjoy working with smart contracts and happy coding! 🎉

