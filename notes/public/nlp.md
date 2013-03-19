
## Language Translator

### Problem Statement:

Enormous data is coming up on the Internet on a daily basis. Since people from different regions of the world are getting the hold of the Internet platform, they express ( or try to express ) in their native language. This leads to a lot of incomprehensible information which is useless until it is presented in a language undersatndible by the reader. If a person surfs Internet, it is normal that he faces text in various different languages. It will be so useful if the language of that text is automatically determined and threrafter translated into the choice of language of the reader.

Abstract Solution:

Build a set of pattern-database for various languages.

Suppose the languages set is represented as :

    L = { language : language in which some text is present on the Internet }

Now for each language  l in set L, there will be a corresponding pattern-database represented as:

    D = { pattern : pattern that corresponds to a language l in L }

So to achieve the above set D, we need a function which maps L -> D.

For each l in L, and d in D:

    f (l) = d


Language Identification <http://www.faganfinder.com/translate/>

Unknown Language Identification <http://complingone.georgetown.edu/~langid/>

<http://www.translation-guide.com/language_identification.htm>
