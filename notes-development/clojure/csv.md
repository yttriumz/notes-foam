---
sitemap:
  lastmod: 2025-07-08 +0000
---

# Handle CSV in Clojure

Last modified: 2025-07-08 +0000

## BOM

**When reading** a UTF-8 file that starts with a BOM, the Java reader correctly interprets the first three bytes (`EF BB BF`) as a single, special Unicode character: `\uFEFF`.

This character is a "zero-width no-break space," but in this context, it's just the in-memory representation of the BOM. The reader prepends this character to the very first piece of data it reads: the first column's header. So it can be manually handled like the following:

```clojure
(with-open [reader (io/reader (fs/file file))]
  (let [csv-data (csv/read-csv reader)
        headers (mapv #(str/replace % "\uFEFF" "") (first csv-data))
        data-rows (rest csv-data)]))
```

This is a high-level, text-based cleanup. It's simple because we let the reader do its job and then fix the result.

**When writing**, we have the opposite problem (mainly for Excel compatibility). We can't just write the `\uFEFF` character and hope the file system converts it into the correct three bytes. We must **guarantee** that the file begins with the literal byte sequence `EF BB BF`.

The only reliable way to do this is to operate at a lower level:

```clojure
(def utf-8-bom (byte-array [-17 -69 -65]))                  ; Cannot directly do (byte 0xEF) because `byte` has range checking.

(with-open [fos (io/output-stream out)]                     ; Opens the file for writing raw bytes, not text.
      (.write fos utf-8-bom)                                ; Writes the three specific bytes that form the BOM signature.
      (with-open [writer (io/writer fos :encoding "UTF-8")] ; Then wraps the raw byte stream in a high-level text writer. This writer will append its text content *after* the BOM we already wrote.
        (csv/write-csv writer (cons header rows))))
```

This is a low-level, byte-based construction. It looks more complex because we are manually building the file structure required by Excel.

*References*:

- [clojure/data.csv: CSV reader/writer to/from Clojure data structures](https://github.com/clojure/data.csv?tab=readme-ov-file#byte-order-mark)
- [jimpil/clj-bom: BOM reading/writing for Clojure](https://github.com/jimpil/clj-bom)
