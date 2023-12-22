# Rust

Last modified: 2023/12/20 GMT+8

- [Interesting posts](#interesting-posts)
  - [Tools](#tools)
  - [Web related](#web-related)
  - [Tutorials](#tutorials)
- [VSCode](#vscode)
  - [`settings.json`](#settingsjson)
  - [`extensions.json`](#extensionsjson)
- [Rust with Flutter](#rust-with-flutter)
- [墙国专属](#墙国专属)

## Interesting posts

- [cheat sheet](https://cheats.rs/)
- [How not to learn Rust](https://dystroy.org/blog/how-not-to-learn-rust/)
- [An unofficial guide to the Rust ecosystem](https://blessed.rs/crates)
- [Are We GUI Yet?](https://github.com/areweguiyet/areweguiyet)
- [Are We Web Yet?](https://github.com/rust-lang/arewewebyet)
- [Which Crates Will Work Off-the-Shelf with WebAssembly?](https://rustwasm.github.io/docs/book/reference/which-crates-work-with-wasm.html)
- [How Much Memory Do You Need to Run 1 Million Concurrent Tasks?](https://pkolaczk.github.io/memory-consumption-of-async/)
- [System Programming Memory Model Implied by RUST](https://t4wydfkrrq.feishu.cn/docx/doxcnM3juNBUJfxGcIWOfJRLk5g)
- [想问下如果用rust写的sdk, 只给库而不是代码.是不是只能在封装dll c接口](https://rustcc.cn/article?id=62bbfc2f-230d-4abc-ad94-8390a8487520)
- [Where is the recommended place to put `use` declarations in Rust?](https://stackoverflow.com/questions/45618552/where-is-the-recommended-place-to-put-use-declarations-in-rust)
- [indexing - How to index a String in Rust - Stack Overflow](https://stackoverflow.com/questions/24542115/how-to-index-a-string-in-rust)
- [Why String can be sliced with usize index? - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/why-string-can-be-sliced-with-usize-index/71437)
- [Rust from Scratch: Smart Pointers](https://medium.com/@zainalpour_79971/rust-from-scratch-smart-pointers-2951b7725760)
- [Why async Rust? - Without boats, dreams dry up](https://without.boats/blog/why-async-rust/)
- [Designing futures for Rust · Aaron Turon](http://aturon.github.io/blog/2016/09/07/futures-design/)
- [判别Fn、FnMut、FnOnce的标准 - Rust语言中文社区](https://rustcc.cn/article?id=8b6c5e63-c1e0-4110-8ae8-a3ce1d3e03b9)
- [Compile-time checks in generic functions work, and you can use them in your code \| More Stina Blog!](https://morestina.net/blog/1940/compile-time-checks-in-generic-functions-work-and-you-can-use-them-in-your-code)
- Rust Is Beyond Object-Oriented:
  - [Rust Is Beyond Object-Oriented, Part 1: Intro and Encapsulation :: The Coded Message](https://www.thecodedmessage.com/posts/oop-1-encapsulation/)
  - [Rust Is Beyond Object-Oriented, Part 2: Polymorphism :: The Coded Message](https://www.thecodedmessage.com/posts/oop-2-polymorphism/)
  - [Rust Is Beyond Object-Oriented, Part 3: Inheritance :: The Coded Message](https://www.thecodedmessage.com/posts/oop-3-inheritance/)
- [Learning Rust, my experience so far has been mixed : rust](https://www.reddit.com/r/rust/comments/18i8y39/learning_rust_my_experience_so_far_has_been_mixed/)

### Tools

- Cargo cache:
  - [Cargo cache cleaning \| Rust Blog](https://blog.rust-lang.org/2023/12/11/cargo-cache-cleaning.html)
  - [How to clear the Cargo cache?](https://stackoverflow.com/questions/25072930/how-to-clear-the-cargo-cache)
  - [cargo clean ~/.cargo · Issue #3289 · rust-lang/cargo](https://github.com/rust-lang/cargo/issues/3289)
- [Does cargo install have an equivalent update command?](https://stackoverflow.com/questions/34484361/does-cargo-install-have-an-equivalent-update-command)

### Web related

- [Rust web framework comparison](https://github.com/flosse/rust-web-framework-comparison)
- [Exploring the top Rust web frameworks](https://blog.logrocket.com/top-rust-web-frameworks/)
- [Which Web Framework do people recommend for Rust in 2023?](https://www.reddit.com/r/rust/comments/12jhxi2/which_web_framework_do_people_recommend_for_rust/)
- [Axum ecosystem](https://github.com/tokio-rs/axum/blob/main/ECOSYSTEM.md)
- [How to use “Type safe routing” of axum](https://mixi-developers.mixi.co.jp/how-to-use-type-safe-routing-of-axum-c06c1b1b1ab)

### Tutorials

- [Learning by doing: An HTTP API with Rust](https://blog.frankel.ch/http-api-rust/)
- [如何在Rust中使用ClickHouse](https://cloud.tencent.com/developer/article/1814306)
- [Rust CRUD API Example with Axum Framework and MySQL](https://codevoweb.com/rust-crud-api-example-with-axum-framework-and-mysql/)
- [Rust CRUD API Example with Axum and PostgreSQL](https://codevoweb.com/rust-crud-api-example-with-axum-and-postgresql/)
- [Build a CRUD API with Rust and MongoDB](https://codevoweb.com/build-a-crud-api-with-rust-and-mongodb/)
- How to Write a Web App in Rust:
  - [Part 1](https://betterprogramming.pub/how-to-write-a-web-app-in-rust-part-1-3047156660a7)
  - [Build the Rust Web App — Reducing CRUD Boilerplate Code With Databases](https://betterprogramming.pub/how-to-write-a-web-app-in-rust-part-2-2da195369fc1)
  - [Building the Rust Web App — How to Use Object-Relational Mapper](https://betterprogramming.pub/building-the-rust-web-app-how-to-use-object-relational-mapper-3af2084555b6)
  - [Building the Rust Web App — Proper Error Handling and Return Values](https://betterprogramming.pub/building-the-rust-web-app-proper-error-handling-and-return-values-723f1f07f8cd)
  - [Building the Rust Web App — Multiple Users and Authentication](https://betterprogramming.pub/building-the-rust-web-app-multiple-users-and-authentication-5ca5988ddfe4)
  - [Building the Rust Web App — Finishing Up](https://medium.com/better-programming/building-the-rust-web-app-finishing-up-1624c9b82f80)
- [使用 Rust 編寫更快的 React 組件](https://www.readfog.com/a/1653827465241530368)
- [I have written a JVM in Rust · Andrea Bergia's Website](https://andreabergia.com/blog/2023/07/i-have-written-a-jvm-in-rust/)
- [RISC-V: 跟着清华训练营从零打造OS](https://mp.weixin.qq.com/mp/appmsgalbum?action=getalbum&__biz=Mzg4Nzk4MTY3Nw==&scene=2&album_id=3162993568748208133)
- [RustForLinux：跟着清华训练营从零打造 Linux 驱动](https://mp.weixin.qq.com/mp/appmsgalbum?__biz=Mzg4Nzk4MTY3Nw==&action=getalbum&album_id=3183255184072835074)
- [Write a Toy VPN in Rust](https://write.yiransheng.com/vpn)

## VSCode

### `settings.json`

```json
"[rust]": {
  "editor.formatOnSave": true,
},
"crates.listPreReleases": true, // Optional
"rust-analyzer.check.command": "clippy",
```

### `extensions.json`

```json
"recommendations": [
  "rust-lang.rust-analyzer",
  "model-checking.kani-vscode-extension",
  "vadimcn.vscode-lldb",
  "serayuzgur.crates",
  "tamasfe.even-better-toml",
  "jscearcy.rust-doc-viewer",
  "ms-azuretools.vscode-docker",
  "mtxr.sqltools",
  "ultram4rine.sqltools-clickhouse-driver",
  "mtxr.sqltools-driver-pg"
]
```

## Rust with Flutter

See [[Flutter#Flutter with Rust]].

## 墙国专属

*References*:

- [RsProxy](https://rsproxy.cn/)

[//begin]: # "Autogenerated link references for markdown compatibility"
[Flutter#Flutter with Rust]: Flutter.md "Flutter"
[//end]: # "Autogenerated link references"
