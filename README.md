# extract-topic
[![coverage: 100%](./.readme-assets/coverage.svg)](https://github.com/liquid-labs/extract-topic/pulls?q=is%3Apr+is%3Aclosed)

Extracts the topic sentence(s) from a given block of text/HTML/Markdown.

## Install

```bash
npm i extract-topic
```

## Usage

```js
import { extractTopic } from 'extract-topic' // ESM
// const { extractTopic } = require('extract-topic') // CJS
const paragraph = "Desire is irrelevant. There is only doing."

console.log('The topic sentence is: ' + extractTopic(paragraph))
// prints: "The topic sentence is: Desire is irrelevant."
```

##  API reference
_API generated with [dmd-readme-api](https://www.npmjs.com/package/dmd-readme-api)._

<a id="extractTopic"></a>
### `extractTopic(text, [options])` ⇒ `string` <sup>↱<sup>[source code](./src/extract-topic.mjs#L42)</sup></sup>

Extracts the topic (typically the first sentence) from a paragraph. The function is HTML, Markdown, and comment
aware and by default will ignore headers and strip formatting.

The algorithm works as follows:
1. Removes any HTML or Markdown style section headers (e.g., '<h1>...</h1>`, '### ...', etc.) (unless
`keepHeaders=true`) and any resulting leading whitespace is removed.
2. Removes comment characters (unless `keepCommentChars=true`).
3. Strips HTML tags (unless `keepTags=true`) and Markdown format (unless `keepMd=true`) and any resulting leading
whitespace is removed.
4. Extracts the first `sentenceCount` sentences (default 1).
5. If the extracted text doesn't fulfill `minChars`, extract the next sentence.
6. Trim the output to `maxChars`, if defined.

Re removing comment signifiers, the function will attempt to remove specified comment signifers from the beginning
of each line in the text (including any leading whitespace) beginning with the designated signifier string. '/*' is
treated as a special multi-line comment signifier. The leading '/*' and trailing '*&sol;' are removed and any
leading '*' characters from the body of the comment are removed (Javadoc style).


| Param | Type | Description |
| --- | --- | --- |
| text | `string` | The original block of text to extract the topic from. |
| [options] | `object` | Extraction options. |
| [options.commentSignifiers] | `Array.<string>` | An array of comment signifiers to be removed.   Pass in an empty array to keep all comment signifiers. See note on removing comment signifiers in function   documentation. |
| [options.keepCommentChars] | `boolean` | If true, then comment signifiers are left in place. |
| [options.keepHeaders] | `boolean` | If true, then HTML and Markdown style headers are left in place. |
| [options.keepMd] | `boolean` | If true, then Markdown formatting is left in place. |
| [options.keepTags] | `boolean` | If true, then HTML style tags are left in place. |
| [options.maxChars] | `number` \| `undefined` | If set, then result will be limited to the indicated   number of characters. |
| [options.minChars] | `number` | If set, then the function will continue to extract sentences until the   `minChars` have been satisfied (regardless of `sentenceCount`). |
| [options.removeBackticks] | `boolean` | If True, then backticks are also removed. |
| [options.sentenceCount] | `number` | The minimum number of sentences to extract. |

**Returns**: `string` - - The extracted topic.
