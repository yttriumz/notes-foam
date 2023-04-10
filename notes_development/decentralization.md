# Decentralization Related

## How does peers in p2p network reach each other?

In a peer-to-peer (P2P) network, peers communicate with each other directly rather than through a centralized server. In order for peers to reach each other, they must first discover each other's network addresses.

Here are some common methods used for peers to discover each other:

- Centralized directory: Peers can register themselves with a centralized directory that keeps track of all the peers in the network. When a peer wants to communicate with another peer, it can query the directory for the network address of the desired peer.

- Tracker server: In a P2P file-sharing network, peers can use a tracker server to discover each other. The tracker server maintains a list of all the peers participating in a specific file-sharing swarm. Peers can then connect directly to each other to download and upload files.

- Distributed hash table (DHT): A DHT is a decentralized system that allows peers to discover each other without relying on a centralized directory or tracker server. Peers can store and retrieve data from the DHT, which acts as a shared database of network addresses.

- UDP hole punching: This technique is used when peers are behind Network Address Translation (NAT) firewalls. Peers can use a third-party server to send packets to each other, which helps to open a temporary "hole" in the firewall so that the two peers can communicate directly with each other.

Once peers have discovered each other's network addresses, they can communicate directly using a variety of protocols, such as TCP or UDP.

### What is centralized directory? is it the same as tracker?

A centralized directory is a database or a registry that maintains a list of all the peers participating in a P2P network along with their network addresses. The directory is typically managed by a central authority, and all the peers in the network communicate with it to discover other peers.

A tracker, on the other hand, is a server that is used in P2P file-sharing networks to coordinate the communication between peers. When a user wants to download a file using a P2P file-sharing program, the program first contacts the tracker server to obtain a list of peers that have the desired file. The program then establishes direct connections with these peers to download the file.

While both centralized directories and trackers serve similar purposes of maintaining a list of peers and their network addresses, they are used in different types of P2P networks. Centralized directories are commonly used in P2P messaging and communication networks, while trackers are used in P2P file-sharing networks.

Furthermore, a tracker is just one of the ways to coordinate communication between peers in a P2P file-sharing network. There are other methods, such as DHT and Peer Exchange (PEX), that can be used to facilitate communication without relying on a centralized server.

### If I do not know any tracker or peer address, how can I discover other peers?

If you don't know any tracker or peer addresses in a P2P network, you can still discover other peers by using a technique called bootstrapping. Bootstrapping is a process by which a new peer can join the P2P network by connecting to at least one existing peer in the network.

Here's how bootstrapping typically works:

- The new peer makes a request to a bootstrap server to obtain the addresses of one or more existing peers in the network.

- The bootstrap server responds with a list of peer addresses.

- The new peer then tries to connect to one of the peers in the list.

- If the connection is successful, the new peer can exchange information with the existing peer to obtain additional peer addresses in the network.

- The new peer can then try to connect to these additional peers, and so on, until it has established connections with a sufficient number of peers.

- Once the new peer has established connections with enough peers, it can start participating in the P2P network and exchanging data with other peers.

It's worth noting that the bootstrap server is not always necessary, and some P2P networks use other methods for bootstrapping, such as distributed hash tables (DHTs) or random walks. However, the basic principle of connecting to existing peers to obtain additional peer addresses remains the same.

### how does distributed hash table (DHT) work?

A distributed hash table (DHT) is a decentralized system that provides a way for peers in a P2P network to discover each other without relying on a central directory or tracker. Instead of a central database, the DHT distributes the storage of data and responsibility for routing messages among all the participating peers in the network.

Here's how a DHT typically works:

- Each peer in the network is assigned a unique identifier, typically a large number or a hash of its network address.

- The DHT system divides the identifier space into a series of smaller subspaces or buckets.

- Each bucket is assigned to a particular peer in the network, which is responsible for storing and maintaining a list of other peers that fall within that bucket's identifier range.

- When a peer wants to discover other peers in the network, it queries the DHT for the list of peers responsible for a particular bucket.

- If the queried peer does not have the requested information, it forwards the request to the next closest peer in the identifier space until the information is found.

- Once the peer receives the list of peers responsible for the desired bucket, it can initiate direct communication with those peers to exchange data or join the network.

- As new peers join or leave the network, the DHT system redistributes the buckets and updates the routing information accordingly.

Overall, a DHT provides a decentralized way for peers to discover each other in a P2P network, without relying on a centralized directory or tracker. By distributing the storage and routing responsibilities among all the participating peers, the DHT system can provide a robust and scalable network architecture that can handle large numbers of peers and frequent peer churn.

## How does a node in libp2p network discover other nodes? What is the difference between this and the classical p2p network?

In the libp2p network, nodes use a combination of peer discovery protocols to discover and connect with other nodes. These protocols include:

- Multicast DNS (mDNS): This protocol allows nodes on the same local network to discover each other by broadcasting service announcements.

- Domain Name System (DNS): Nodes can use DNS records to obtain the IP addresses of other nodes.

- Peer Routing: Nodes can use DHT-based peer routing to discover other nodes on the network.

- Bootstrap nodes: Nodes can connect to pre-defined bootstrap nodes to obtain information about other nodes in the network.

These protocols work together to provide a robust and flexible mechanism for peer discovery in the libp2p network. In addition to these standard protocols, libp2p also supports a range of other peer discovery methods, such as custom discovery protocols and integration with other P2P networks like IPFS and Ethereum.

One key difference between libp2p and classical P2P networks is the modular and extensible design of libp2p. Libp2p is designed to be highly customizable and allows developers to choose which protocols and components to use based on their specific needs. This makes libp2p suitable for a wide range of applications, from messaging to file sharing to blockchain networks.

Another difference is that libp2p is designed to work across a wide range of network environments, from local networks to the internet to offline and low-bandwidth environments. This makes it a flexible and versatile solution for P2P networking in a variety of contexts.

## How does a peer in libp2p network discover other peer? What is the difference between this and the classical p2p network?

In a libp2p network, a peer can discover other peers using a combination of peer discovery protocols, including mDNS, DNS, peer routing, and bootstrap nodes.

Here's how peer discovery typically works in libp2p:

- When a peer starts up, it initiates a discovery process by sending out messages to other peers on the network using one or more peer discovery protocols.

- If the peer receives a response from another peer, it can exchange information about its own capabilities and network status with that peer, as well as obtain information about other peers on the network.

- The peer can then use this information to initiate connections with other peers on the network, forming a mesh of interconnected peers that can exchange data and messages.

- As new peers join or leave the network, the discovery process continues, with each peer updating its list of known peers and sharing this information with others on the network.

One key difference between libp2p and classical P2P networks is the use of multiple peer discovery protocols. In classical P2P networks, a single discovery protocol, such as a tracker or DHT, is typically used to discover other peers on the network. In contrast, libp2p uses a combination of protocols to provide robust and flexible peer discovery, with different protocols used depending on the specific network environment and context.

Another difference is that libp2p is designed to be modular and extensible, with a wide range of components and protocols that can be customized and combined to suit different use cases. This makes it a flexible and adaptable solution for P2P networking in a variety of contexts, from file sharing to messaging to blockchain networks.

## nostr

### relay

check global relays:

- https://stats.nostr.band/
- https://nostr.watch/relays/find
