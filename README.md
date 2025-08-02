# SociaStack - Next-Generation Social Finance Protocol

## 📖 Overview

SociaStack revolutionizes digital content monetization through blockchain-native social validation, enabling creators to earn Bitcoin-backed rewards while building verifiable on-chain reputation through community-driven quality assessment.

Built on the Stacks blockchain with Bitcoin security, SociaStack introduces a sophisticated reputation economy where content quality directly correlates with monetary rewards. The protocol employs stake-weighted voting mechanisms to ensure authentic engagement while implementing anti-gaming measures through Sybil-resistant algorithms.

## 🌟 Key Features

### Core Functionality

- **Stake-Weighted Voting**: Users stake STX tokens to participate in content evaluation
- **Dynamic Reputation System**: Real-time reputation scoring based on content quality and community interaction
- **Bitcoin-Backed Rewards**: Earn BTC-denominated rewards for high-quality content
- **Anti-Gaming Measures**: Sybil-resistant algorithms prevent manipulation
- **Transparent Governance**: Community-driven protocol governance

### Advanced Features

- **Programmable Reputation Scoring**: Algorithmic reputation calculation with multiple factors
- **Automated Reward Pools**: Self-sustaining reward distribution system
- **Cross-Platform Content Verification**: Verifiable content authenticity
- **Follower-Based Influence Metrics**: Social graph influence calculations
- **Emergency Controls**: Administrative functions for protocol security

## 🏗️ Architecture

### Smart Contract Structure

The protocol consists of a single, comprehensive smart contract (`socia-stack.clar`) that manages:

- **User Management**: Registration, staking, and profile management
- **Content Creation**: Content publishing with stake backing
- **Voting System**: Community-driven content evaluation
- **Reward Distribution**: Automated reward calculations and distribution
- **Social Features**: Following/unfollowing mechanisms
- **Administrative Controls**: Protocol governance and emergency functions

### Data Models

#### Users

```clarity
{
  reputation-score: uint,
  total-content: uint,
  total-earnings: uint,
  stake-amount: uint,
  last-action-block: uint,
  verified: bool,
  join-block: uint
}
```

#### Content

```clarity
{
  creator: principal,
  content-hash: (string-ascii 64),
  title: (string-utf8 100),
  category: (string-ascii 20),
  timestamp: uint,
  total-votes: uint,
  positive-votes: uint,
  quality-score: uint,
  reward-claimed: bool,
  stake-backing: uint
}
```

## 🚀 Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) v2.0+
- [Node.js](https://nodejs.org/) v18+
- [npm](https://www.npmjs.com/) or [yarn](https://yarnpkg.com/)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/brian-yando/socia-stack.git
   cd socia-stack
   ```

2. **Install dependencies**

   ```bash
   npm install
   ```

3. **Verify installation**

   ```bash
   clarinet check
   ```

### Development Setup

1. **Run tests**

   ```bash
   npm test
   ```

2. **Run tests with coverage**

   ```bash
   npm run test:report
   ```

3. **Watch mode for development**

   ```bash
   npm run test:watch
   ```

4. **Start Clarinet console**

   ```bash
   clarinet console
   ```

## 🧪 Testing

The project uses Vitest with Clarinet SDK for comprehensive testing:

```bash
# Run all tests
npm test

# Run tests with coverage and cost analysis
npm run test:report

# Watch files and re-run tests on changes
npm run test:watch
```

### Test Structure

- **Unit Tests**: Individual function testing
- **Integration Tests**: Cross-function interaction testing
- **Gas Cost Analysis**: Transaction cost optimization
- **Edge Case Testing**: Boundary condition validation

## 📋 Usage Examples

### User Registration

```clarity
;; Register a new user
(contract-call? .socia-stack register-user)
```

### Stake Tokens

```clarity
;; Stake 5 STX tokens
(contract-call? .socia-stack stake-tokens u5000000)
```

### Create Content

```clarity
;; Create new content with stake backing
(contract-call? .socia-stack create-content 
  "content-hash-here" 
  u"My Amazing Content Title" 
  "technology" 
  u1000000)
```

### Vote on Content

```clarity
;; Upvote content with ID 1
(contract-call? .socia-stack vote-content u1 true)
```

### Follow User

```clarity
;; Follow another user
(contract-call? .socia-stack follow-user 'SP1234567890ABCDEF)
```

## 🔧 Configuration

### Protocol Parameters

- **Minimum Stake**: 1 STX (1,000,000 microSTX)
- **Platform Fee**: 0.5%
- **Starting Reputation**: 100 points
- **Voting Weight Calculation**: Base(1) + Reputation/100 + Stake/1M

### Environment Configuration

The protocol supports multiple environments:

- **Devnet**: Local development environment
- **Testnet**: Public testing environment  
- **Mainnet**: Production environment

Configuration files are located in the `settings/` directory.

## 🔐 Security Features

### Anti-Gaming Mechanisms

- **Stake Requirements**: Users must stake tokens to participate
- **Self-Voting Prevention**: Users cannot vote on their own content
- **Duplicate Vote Prevention**: One vote per user per content
- **Reputation-Based Weighting**: Higher reputation users have more influence

### Access Controls

- **Owner-Only Functions**: Critical protocol functions restricted to contract owner
- **User Validation**: Input validation for all user interactions
- **Emergency Controls**: Circuit breakers for protocol security

### Error Handling

Comprehensive error handling with specific error codes:

- `u100`: Owner-only access required
- `u101`: Resource not found
- `u102`: Resource already exists
- `u103`: Insufficient funds
- `u104`: Unauthorized action
- And more...

## 📊 Economics

### Reward Mechanism

1. **Content Creation**: Creators stake tokens to publish content
2. **Community Voting**: Users vote on content quality with stake-weighted votes
3. **Quality Scoring**: Dynamic quality scores based on positive vote ratio
4. **Reward Distribution**: High-quality content earns proportional rewards
5. **Reputation Updates**: All participants earn reputation based on actions

### Token Flow

- **Inflow**: Users stake STX tokens, reward pool contributions
- **Outflow**: Content rewards, unstaking, platform fees
- **Locked**: Staked tokens backing content and user participation

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes**: Follow coding standards and add tests
4. **Run tests**: Ensure all tests pass
5. **Commit changes**: Use conventional commit messages
6. **Push to branch**: `git push origin feature/amazing-feature`
7. **Create Pull Request**: Describe your changes and their impact

### Development Guidelines

- Write comprehensive tests for new features
- Follow Clarity best practices
- Add documentation for public functions
- Ensure gas efficiency
- Maintain backward compatibility

## 📄 License

This project is licensed under the ISC License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- **Documentation**: [Coming Soon]
- **Discord**: [Coming Soon]
- **Twitter**: [Coming Soon]
- **Website**: [Coming Soon]

## 🙏 Acknowledgments

- **Stacks Foundation** for the robust blockchain infrastructure
- **Hiro Systems** for excellent developer tools
- **Bitcoin Community** for the underlying security model
- **Open Source Contributors** for continuous improvement

---

### Built with ❤️ on Stacks

*SociaStack is establishing a new standard for decentralized social finance infrastructure, creating a self-sustaining creator economy powered by Bitcoin security.*
