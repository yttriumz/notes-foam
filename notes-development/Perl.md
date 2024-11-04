---
sitemap:
  lastmod: 2024-10-30 +0000
---

# Perl

Last modified: 2024-10-30 +0000

- [Interesting posts](#interesting-posts)
- [Development environment](#development-environment)
  - [Perlbrew](#perlbrew)
- [One-liners](#one-liners)
- [Regex](#regex)
  - [Catastrophic Backtracking](#catastrophic-backtracking)
- [Appendices](#appendices)

## Interesting posts

- [Official icon for perl programming language : r/perl](https://www.reddit.com/r/perl/comments/ok809e/official_icon_for_perl_programming_language/)
- [perlhack - How to hack on Perl - Perldoc Browser](https://perldoc.perl.org/perlhack)
- [perlinterp - An overview of the Perl interpreter - Perldoc Browser](https://perldoc.perl.org/perlinterp)
- [Why Perl? \| Hacker News](https://news.ycombinator.com/item?id=35646612)
- [Long Live Perl!. Still the Gold Standard \| by Rob Muhlestein \| Medium](https://medium.com/@rwxrob/long-live-perl-922b0a1194ef)
- [Why Perl is still relevant in 2022 - Stack Overflow](https://stackoverflow.blog/2022/07/06/why-perl-is-still-relevant-in-2022/)
- [Is there any good reason not to use perl scripts in place of bash logic? : r/perl](https://www.reddit.com/r/perl/comments/tk9t75/is_there_any_good_reason_not_to_use_perl_scripts/)
- [What are the differences between Perl, Python, AWK and sed? - Stack Overflow](https://stackoverflow.com/questions/366980/what-are-the-differences-between-perl-python-awk-and-sed)
- [Unix shell versus Perl](https://www.perlmonks.org/?node_id=668481)
- [What's the consensus on Perl scripting : r/linuxadmin](https://www.reddit.com/r/linuxadmin/comments/dtyhuk/whats_the_consensus_on_perl_scripting/)
- [Is Perl a write only language? : r/perl](https://www.reddit.com/r/perl/comments/18couta/is_perl_a_write_only_language/)
- [What Happened to Perl 7? \| Hacker News](https://news.ycombinator.com/item?id=31515787)
- [The Future of Perl](https://ovid.github.io/articles/the-future-of-perl.html)
- [Anyone interested in starting/joining a Perl Discord : r/perl](https://www.reddit.com/r/perl/comments/g9tcgn/anyone_interested_in_startingjoining_a_perl/)
- [Perl first commit: a “replacement” for Awk and sed \| Hacker News](https://news.ycombinator.com/item?id=36650120)
- [Life of a Computer Scientist: Using Perl like awk and sed](https://lifecs.likai.org/2008/10/using-perl-like-awk-and-sed.html)
- [Most popular Perl 5 web framework? : r/perl](https://www.reddit.com/r/perl/comments/1574tx3/most_popular_perl_5_web_framework/)
- [But I can't use CPAN](https://archive.shadowcat.co.uk/blog/matt-s-trout/but-i-cant-use-cpan/)
- [regex - What are the differences between glob-style patterns and regular expressions? - Stack Overflow](https://stackoverflow.com/questions/23702202/what-are-the-differences-between-glob-style-patterns-and-regular-expressions)
- [Perl and why you use it : r/perl](https://www.reddit.com/r/perl/comments/1dzblqj/perl_and_why_you_use_it/)
- [Why does OpenBSD still include Perl in its base installation? \| Hacker News](https://news.ycombinator.com/item?id=23360338)
- [The Perl and Raku Conference 2024 - Las Vegas \| Keith's Krazy Web Site](https://www.kcaran.com/posts/the-perl-and-raku-conference-2024-las-vegas.html)
- [Is Perl the dying Pontiac? : r/perl](https://www.reddit.com/r/perl/comments/1ecjhfh/is_perl_the_dying_pontiac/)
- [This is not your grandfather's Perl - Stack Overflow](https://stackoverflow.blog/2022/09/08/this-is-not-your-grandfathers-perl/)

Language:

- [Perl keywords - learn.perl.org](https://learn.perl.org/docs/keywords.html)
- [Functional programming in Perl - functional-perl.org](http://functional-perl.org/)
- [Passing by](https://www.perl.com/article/passing-by/)
- [subroutine - Perl calling methods with and without parentheses - Stack Overflow](https://stackoverflow.com/questions/25523983/perl-calling-methods-with-and-without-parentheses)
- [When can I omit the parentheses? : r/perl](https://www.reddit.com/r/perl/comments/17r1h5v/when_can_i_omit_the_parentheses/)
- [Is "my" a function in Perl? - Stack Overflow](https://stackoverflow.com/questions/17358800/is-my-a-function-in-perl)
- [scope - Local and Global variables in perl - Stack Overflow](https://stackoverflow.com/questions/19100106/local-and-global-variables-in-perl)
- [perl - Is there such a thing as a list in scalar context? - Stack Overflow](https://stackoverflow.com/questions/8232951/is-there-such-a-thing-as-a-list-in-scalar-context)
- [Is the order of use of perl modules followed when evaluating subroutines? - Stack Overflow](https://stackoverflow.com/questions/59204393/is-the-order-of-use-of-perl-modules-followed-when-evaluating-subroutines)
- [unicode - Why does modern Perl avoid UTF-8 by default? - Stack Overflow](https://stackoverflow.com/questions/6162484/why-does-modern-perl-avoid-utf-8-by-default/6163129#6163129)
- [In Perl, what is the difference between a .pm (Perl module) and .pl (Perl script) file? - Stack Overflow](https://stackoverflow.com/questions/3402821/in-perl-what-is-the-difference-between-a-pm-perl-module-and-pl-perl-script)
- [Efficient Perl Code Error Handling Techniques](https://marketsplash.com/perl-code-error-handling-techniques/)
- [Best practices for handling exceptions in die/eval style](https://www.perlmonks.org/?node_id=1221326)
- [Why it's stupid to `use a variable as a variable name'](https://perl.plover.com/varvarname.html)
- [Why is Perl not putting Moose in the core?](https://ovid.github.io/articles/why-is-perl-not-putting-moose-in-the-core.html)
- [Politics in Programming](https://ovid.github.io/blog/politics-in-programming.html)
- [use lib "."](https://www.perlmonks.org/?node_id=11153844)
- `$?`:
  - [What does it mean when I get a huge exit status when closing a pipe in perl - Stack Overflow](https://stackoverflow.com/questions/29914583/what-does-it-mean-when-i-get-a-huge-exit-status-when-closing-a-pipe-in-perl)
  - [Why is the exit code 255 instead of -1 in Perl? - Stack Overflow](https://stackoverflow.com/questions/2726447/why-is-the-exit-code-255-instead-of-1-in-perl)
- [rose db object - Perl module "did not return a true value" - Stack Overflow](https://stackoverflow.com/questions/5012665/perl-module-did-not-return-a-true-value)
- [The problem of "the" default shell](https://www.perlmonks.org/?node_id=1205217)
- [print "@array" will add space but print @array wouldn't in Perl : r/perl](https://www.reddit.com/r/perl/comments/17r6wfp/print_array_will_add_space_but_print_array/)
- [symbolic references - Why does Perl evaluate code in ${...} during string interpolation? - Stack Overflow](https://stackoverflow.com/questions/2332815/why-does-perl-evaluate-code-in-during-string-interpolation)
- [Perl module names are filepaths - and that's all](https://www.perl.com/article/perl-module-names-are-filepaths-and-that-s-all/)
- [The curious case of implicit return](https://perlmaven.com/curious-case-of-implicit-return)
- [Why I Like Perl's OO // David Raab](https://davidraab.github.io/posts/why-i-like-perls-oo/)
  - [Why I Like Perl's OO : r/perl](https://www.reddit.com/r/perl/comments/1c6zq24/why_i_like_perls_oo/)
- [directory - How to create a folder using mkdir in Perl? - Stack Overflow](https://stackoverflow.com/questions/60387401/how-to-create-a-folder-using-mkdir-in-perl)

Toolkit:

- [What is the Perl Core?](https://www.perl.com/article/what-is-the-perl-core-/)
- [How can I tell if a Perl module is core or part of the standard install? - Stack Overflow](https://stackoverflow.com/questions/2049735/how-can-i-tell-if-a-perl-module-is-core-or-part-of-the-standard-install)
- [perl - How do I get a list of installed CPAN modules? - Stack Overflow](https://stackoverflow.com/questions/115425/how-do-i-get-a-list-of-installed-cpan-modules/58114369#58114369)
- [How to Install Perlbrew and Manage Multiple Versions of Perl 5 on CentOS 7 \| DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-install-perlbrew-and-manage-multiple-versions-of-perl-5-on-centos-7)
- [\[Perl\]如何在 Visual Studio Code 建立 Perl 的程式開發環境 (Windows/Linux) \| Vixual](http://www.vixual.net/blog/archives/98)
- [packaging - Bundling up a perl script with its dependencies? - Stack Overflow](https://stackoverflow.com/questions/28716807/bundling-up-a-perl-script-with-its-dependencies)

Docs:

- [Perl Releases - dev.perl.org](https://dev.perl.org/perl5/news/)
- [perltoc - perl documentation table of contents - Perldoc Browser](https://perldoc.perl.org/perltoc)

Tutorials:

- [Learn Perl - www.perl.org](https://www.perl.org/learn.html)
- [Tutorials](https://www.perlmonks.org/?node=Tutorials)
- [perlstyle - Perl style guide - Perldoc Browser](https://perldoc.perl.org/perlstyle):
  >
  > ```perl
  > $ALL_CAPS_HERE   # constants only (beware clashes with perl vars!)
  > $Some_Caps_Here  # package-wide global/static
  > $no_caps_here    # function scope my() or local() variables
  > ```
  >
- [perl - The Perl 5 language interpreter - Perldoc Browser](https://perldoc.pl/perl#Tutorials)
- [Modern Perl: a Perl Tutorial 4e Table of Contents](http://modernperlbooks.com/books/modern_perl_2016/index.html)
- [Learn Perl in about 2 hours 30 minutes @ Things Of Interest](https://qntm.org/perl_en)
  - [Learn Perl in about 2 hours 30 minutes : r/programming](https://www.reddit.com/r/programming/comments/j5er5/learn_perl_in_about_2_hours_30_minutes/)
- [perl.gr - Getting started](https://perl.gr/en/getting-started)
- [Perl Tutorial](https://www.perltutorial.org/)
- [Perl Maven - for people who want to get the most out of programming in Perl](https://perlmaven.com/)
- [Perl 程式設計教學 – G. T. Wang](https://blog.gtwang.org/programming/perl/)
- [Index of /archive/2012/winter/10100-1/html/perl](https://klasses.cs.uchicago.edu/archive/2012/winter/10100-1/html/perl/)
- [Perl C++ C# 使用 POST GET 存取 JSON 等網路資源 \| 人生海海](https://heavenchou.buddhason.org/node/314)

## Development environment

Pre-installed:

- CentOS Linux release 7.9.2009: `v5.16.3` without `cpan`
  - Unicode: 6.1
  - Modules installed: See [Appendices](#modules-on-centos-792009).

- Ubuntu 22.04.4 LTS: `v5.34.0` with `cpan`
  - Modules installed: See [Appendices](#modules-on-ubuntu-2204).

### Perlbrew

- openSUSE Tumbleweed: See [[openSUSE/dev-env#Perl]].

## One-liners

- Remove carriage return: `perl -i -pe 's/\r//' PATH/TO/FILE`

*References*:

- [learnbyexample/learn_perl_oneliners: Example based guide for text processing with Perl from the command line](https://github.com/learnbyexample/learn_perl_oneliners)
- [Perl one-liners](https://gist.github.com/joyrexus/7328094)
- [Demystifying Perl One-Liners - Walter C. Mankowski - TPRC 2024 - YouTube](https://www.youtube.com/watch?v=ZqSddysHJb0)
- [Remove carriage return in Unix - Stack Overflow](https://stackoverflow.com/questions/800030/remove-carriage-return-in-unix/35065082#35065082)

## Regex

*References*:

- [Regular-Expressions.info](https://www.regular-expressions.info/refquick.html)
- [string - Regex not operator - Stack Overflow](https://stackoverflow.com/questions/7317043/regex-not-operator)
- [regex - Regular expression to match EOF - Stack Overflow](https://stackoverflow.com/questions/1171284/regular-expression-to-match-eof)

### Catastrophic Backtracking

From Phind:

> Crafting a regular expression that takes years to match input strings is a technique known as a "catastrophic backtracking" exploit. This happens when a regular expression is designed in such a way that it forces the regex engine to explore an exponentially growing number of possibilities before concluding that a match has been found or that no match is possible. This can lead to extremely slow performance, effectively causing a denial-of-service (DoS) attack against programs that process such regular expressions, especially if the input strings are large or if the regex engine is inefficient in handling the backtracking.
>
> ### Principle Behind Crafting Such Regex
>
> The principle behind crafting such a regex involves exploiting the regex engine's behavior during the backtracking phase. Here's a simplified explanation:
>
> 1. **Excessive Backtracking**: The regex is designed in a way that it repeatedly tries different paths to find a match, leading to a situation where the regex engine spends a lot of time exploring dead ends.
>
> 2. **Nested Quantifiers**: Placing nested quantifiers (`*` or `+`) around groups that can match a wide variety of inputs encourages the regex engine to explore many combinations.
>
> 3. **Alternation and Lookahead/Ahead Assertions**: Using alternation (`|`) combined with lookahead or lookbehind assertions can significantly increase the number of branches the regex engine needs to explore.
>
> ### Example
>
> Consider the following regex pattern:
>
> ```regex
> ^(?!.*(.*)\1)(.*)(?=.*\1).$
> ```
>
> This pattern attempts to match any string that repeats the same sequence of characters twice. However, it uses a negative lookahead `(?!.*(.*)\1)` to ensure that the repeated sequence is not the entire string, and then another lookahead `(?=.*\1)` to check for the repetition. This pattern can cause catastrophic backtracking because:
>
> - The innermost group `(.*)` matches any character zero or more times.
> - The outermost group `.*` again matches any character zero or more times.
> - The negative lookahead `(?!.*(.*)\1)` checks for the absence of the entire string being the repeated sequence, which is unnecessary and adds complexity.
> - The final lookahead `(?=.*\1)` checks for the repetition of the sequence.
>
> ### How It Works
>
> For a string like `"abcabc"`, the regex engine starts by trying to match the first character. Then, it enters the first lookahead, which tries to match the entire string as the repeated sequence, failing because the string is not a palindrome. It then moves on to the next part of the regex, which tries to match any character, and then enters the second lookahead, which again tries to match the entire string as the repeated sequence, failing for the same reason. This process repeats, with the regex engine constantly checking for the repeated sequence and failing, leading to excessive backtracking.
>
> ### Mitigation
>
> To mitigate the risk of catastrophic backtracking, developers should:
>
> - Avoid using nested quantifiers excessively.
> - Limit the use of alternation and lookahead/lookbehind assertions.
> - Prefer simpler patterns whenever possible.
> - Validate and sanitize user input to prevent injection attacks that could introduce malicious regex patterns.
>
> Understanding and mitigating the risks associated with regular expressions is crucial for developing secure and efficient applications.

*References*:

- [Runaway Regular Expressions: Catastrophic Backtracking](https://www.regular-expressions.info/catastrophic.html)
- [Catastrophic Backtracking in Regular Expressions \| by Dheeraj Kumar Rao \| JavaScript Kingdom \| Medium](https://medium.com/javascript-kingdom/catastrophic-backtracking-in-regular-expressions-df717661da18)

## Appendices

- [[modules]]

[//begin]: # "Autogenerated link references for markdown compatibility"
[openSUSE/dev-env#Perl]: ../notes-OS/Linux/openSUSE/dev-env.md "openSUSE Development Environment"
[modules]: attachments/Perl/modules.md "Default Installed Modules"
[//end]: # "Autogenerated link references"