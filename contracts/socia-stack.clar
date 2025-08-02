;; Title: SociaStack - Next-Generation Social Finance Protocol
;;
;; Summary:
;; SociaStack revolutionizes digital content monetization through blockchain-native 
;; social validation, enabling creators to earn Bitcoin-backed rewards while building 
;; verifiable on-chain reputation through community-driven quality assessment.
;;
;; Description:
;; SociaStack represents a paradigm shift in social media economics, transforming 
;; traditional engagement metrics into tangible financial value. Built on Stacks 
;; blockchain with Bitcoin security, this protocol introduces a sophisticated 
;; reputation economy where content quality directly correlates with monetary rewards.
;; 
;; The system employs stake-weighted voting mechanisms to ensure authentic engagement,
;; while implementing anti-gaming measures through Sybil-resistant algorithms. Users 
;; stake STX tokens to participate, earning both reputation points and BTC-denominated 
;; rewards based on content performance and peer validation. The protocol features 
;; dynamic reward distribution, follower-based influence metrics, and transparent 
;; governance structures that collectively create a self-sustaining creator economy.
;;
;; Key innovations include programmable reputation scoring, automated reward pools,
;; and cross-platform content verification - establishing a new standard for 
;; decentralized social finance infrastructure.

;; ERROR CONSTANTS

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-found (err u101))
(define-constant err-already-exists (err u102))
(define-constant err-insufficient-funds (err u103))
(define-constant err-unauthorized (err u104))
(define-constant err-invalid-amount (err u105))
(define-constant err-self-interaction (err u106))
(define-constant err-already-voted (err u107))
(define-constant err-invalid-score (err u108))
(define-constant err-stake-required (err u109))
(define-constant err-cooldown-active (err u110))
(define-constant err-invalid-input (err u111))

;; PROTOCOL CONFIGURATION

(define-data-var contract-enabled bool true)
(define-data-var min-stake-amount uint u1000000)      ;; 1 STX minimum stake
(define-data-var reputation-multiplier uint u100)
(define-data-var content-reward-pool uint u0)
(define-data-var platform-fee-rate uint u50)          ;; 0.5% platform fee

;; CORE DATA STRUCTURES

(define-map users
  principal
  {
    reputation-score: uint,
    total-content: uint,
    total-earnings: uint,
    stake-amount: uint,
    last-action-block: uint,
    verified: bool,
    join-block: uint,
  }
)

(define-map content
  uint
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
    stake-backing: uint,
  }
)

(define-map votes
  {
    content-id: uint,
    voter: principal,
  }
  {
    vote-type: bool,                                   ;; true = upvote, false = downvote
    stake-weight: uint,
    timestamp: uint,
  }
)

(define-map user-following
  {
    follower: principal,
    following: principal,
  }
  bool
)

(define-map reputation-history
  {
    user: principal,
    block: uint,
  }
  {
    old-score: uint,
    new-score: uint,
    reason: (string-ascii 50),
  }
)