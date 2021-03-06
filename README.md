---

<h1>ADMIRAL programming language for DCPU-16</h1>
<h5><i>"PURE INTERPRETED LANGUAGE FOR THE FRINGE COLONIES"</i></h5>

---
<h4>Table of contents</h4>
<ul>
  <li><a href="#1">Background</a>
    <ul>
      <li><a href="#1.1">Summary</a></li>
      <li><a href="#1.2">Development Status</a></li>
      <li><a href="#1.3">Special Thanks</a></li>
      <li><a href="#1.4">Other in-game DCPU projects</a></li>
    </ul>
  </li>
  <li><a href="#2">Getting started</a>
    <ul>
      <li><a href="#2.1">Download</a></li>
      <li><a href="#2.2">Development</a></li>
      <li><a href="#2.3">Usage</a></li>
    </ul>
  </li>
  <li><a href="#4">Data types</a>
    <ul>
      <li><a href="#4.1">Numbers</a></li>
      <li><a href="#4.2">String</a></li>
      <li><a href="#4.3">Dictionary</a></li>
      <li><a href="#4.4">List</a></li>
      <li><a href="#4.5">Tuple</a></li>
      <li><a href="#4.6">Boolean</a></li>
      <li><a href="#4.7">None</a></li>
    </ul>
  </li>
  <li><a href="#5">Statements</a>
    <ul>
      <li><a href="#5.1">Simple statements</a></li>
      <li><a href="#5.2">Compound statements</a></li>
    </ul>
  </li>
  <li><a href="#6">Global functions</a>
  </li>
  <li><a href="#7">Appendixes</a>
  </li>
</ul>

---
<h4 id="1">Background</h4>

<h5 id="1.1">Summary</h5>

<h6>Design Philosophy</h6>
 - DCPU must provide a self sufficient environment for developing and running software
 - Capability is more important than capacity 
 - Users shouldn't be bothered with details that the machine can handle
 - A bug in the user’s Admiral-code should not be allowed to lead to undefined behavior 
   of the interpreter (except poke() and call())
 - Should there be no limit on the range of numbers, the length of strings, or the size 
   of collections (other than the total memory available)

<h6>Implementation Principles</h6>
 - "First make it work. Then make it right. Then make it fast."
 - Memory allocation targets:
   - 70% for heap
   - 5% for stack
   - 25% for admiral core (including static memory buffers)
 - Memory is conserved by using direct one-pass interpreter
   - It is quite slow, but could be boosted with AST compiler - memory-speed trade-off 
 - Pratt’s algorithm for efficient expression parsing
 - Mark and sweep garbage collector for memory conservation and detecting trash even with reference loops
 - Floppy load/save uses object graph serialization e.g. 
   - save("big.obj", big_obj)
   - big_obj = load("big.obj")

<h6>Examples</h6>

Classic Hello World in Admiral.

<pre>
>print 'Hello World'
Hello World
</pre>

..or as a function call:

<pre>
>hello="print 'Hello World'"  # assign function string to 'hello'
>hello()                      # call 'hello' as function
Hello World                   # output
</pre>

In Admiral - ANY and ALL strings can be called as functions! You could even write:

<pre>
>'print argv[0]'('Hello World')   # crazy way to call constant string as function
Hello World                       # function output
</pre>

Here is another example of Admiral code. A function that calculates square Root for integers and floats:

<pre>
>sqrt=edit()                  # start integrated editor
</pre>
<pre>
p=0                           # define variable
x=argv[0]                     # assign first unnamed function argument to x
while not x==p:               # loop to calculate sqrt
 p=x
 x=(x**2+argv[0])/(2*x)
return x                      # return value
</pre>
<pre>
>print sqrt(81.0)             # function call with float argument
9.00000000
>print sqrt(81)               # function call with integer argument
9
</pre>

Example: variable swap
<pre>
>a=1
>b=2
>a,b=b,a
</pre>

Example: dictionary printing
<pre>
>d={'a':1,'b':2}
>for k,v in d:print k, v
a 1
b 2
</pre>

--

<h5 id="1.2">Development status</h5>

<h6>Current features</h6>
 - Pure interpreted language
   - Python inspired grammar
   - Garbage collection
   - Dynamic typing
   - Prototype based inheritance
   - Data types
     - Variable length integers (only limited by available heap space)
     - Floats with compile time precision selection (1+ words for mantissa)
     - Booleans, strings, lists, tuples and dicts
 - Integrated code editor with gap buffer
 - Object serialization for floppy
 - Dict implementation with binary search
 - Nice starting set of built-in functions
 - Interactive command prompt with line editing
 - Functions: poke(), peek() and call() for low level access
 - Functions: hwn(), hwq() and hwi() for low level hardware access
 - Functions: HIC select, status, read and transmit functions for TechCompliant HIC hardware
 
<h6>Next in development</h6>
 - Github issue tracker contains a list of development items
 - Support for other TechCompliant hardware

--

<h5 id="1.3">Special Thanks</h5>

Following sources were proven to be invaluable sources for information:
 - Let's Build a Compiler, by Jack Crenshaw: http://compilers.iecc.com/crenshaw/
 - Top Down Operator Precedence, by Douglas Crockford: http://javascript.crockford.com/tdop/tdop.html
 - Simple Top-Down Parsing in Python, by Fredrik Lundh: http://effbot.org/zone/simple-top-down-parsing.html
 - The Art of Assembly Language Programming, by Randall Hyde: http://cs.smith.edu/~thiebaut/ArtOfAssembly/artofasm.html
 - Data Structures and Algorithms with Object-Oriented Design Patterns in Java, by Bruno R. Preiss: http://www.brpreiss.com/books/opus5/html/book.html

--

<h5 id="1.4">Other in-game DCPU projects</h5>

There are dozens of advanced compilers that compile DCPU assembler from multitude of different source languages 
e.g. java, c, c++, ...

However, these compilers run IRL and emit outside processing power to in-game universe :) That is agains the
Admiral´s philosophy and I present here only the projects that interpret or compile some higher level
language *inside* DCPU.

 - umbibium´s CBM64 Basic: https://github.com/unbibium/dcpu-cbmbasic
   - Amazing port of Commodore 64 BASIC and KERNAL to the DCPU-16
 - hellige´s goforth: https://github.com/hellige/dcpu
   - I know nothing about forth, so the DCPU role in this project is a mystery for me :)

--

<h4 id="2">Getting started</h4>

<h5 id="2.1">Download</h5>

The latest version of Admiral release is available from github:

 - https://github.com/orlof/dcpu-admiral/releases

The admiral.bin is the precompiled binary file that should run in emulators.

However, if you only want a quick peek at the Admiral, the easies way to try it is with Admiral Emulator:

 - https://github.com/orlof/admiral-emu/releases

Note that Admiral Emulator contains older version of Admiral and is not maintained at the moment.
    
--

<h5 id="2.2">Development</h5>

All source code is available in Github:

    https://github.com/orlof/dcpu-admiral

Since the collapse of 0x10c, most of the DCPU development tools have been abandoned. Admiral used to work with
all the major tools e.g. DevCPU, DCPU toolchain, Organic & Lettuce, F1DE...

Today I use my self-made assembler and debugger:

 - https://github.com/orlof/dcpu-compiler
   - Python 2.7, Notchian syntax
 - https://github.com/orlof/dcpu-debugger
   - Java 1.8, graphical ui

Those are pretty sophisticated and field proven tools, but will lack proper releases and packaging until
someone other than me starts using them ;)

--

<h5 id="2.3">Usage</h5>

NOTE: Latest Admiral interpreter does not output return value automatically to screen. Instead 'print' statement 
must be used.

When Admiral starts, it will show an interactive prompt '>' and wait for input. It can evaluate one line statements.
<pre>
>print 1+2**32
4294967297 
>for a in range(5): print a 
0 
1 
2 
3 
4
</pre>

Admiral also has a built-in text editor to facilitate software development in deep space colonies. It is 
started by calling edit(). edit() returns the edited text as string that can be assigned to a variable.
To exit the editor hold down CTRL and then press x (CTRL-x). If you want to discard your editing, 
use CTRL-c, which will return the original string instead of the edited version.

    result=edit()

If you need to edit an existing text, you can give a string argument for edit():

    result=edit(result)

Since Admiral is pure interpreter all strings are callable (i.e. can be used as functions):

<pre>
>'print msg'(msg='Hello World again!') 
Hello World again!
</pre>

Function calls can have positional and keyword arguments in any order.

Example: only keyword arguments (type='Monster", size='XXXL')
<pre>
get_danger_level(type='Monster", size='XXXL')
</pre>

Example: only positional arguments (argv[0]='Monster' and argv[1]='XXXL')
<pre>
get_danger_level('Monster', 'XXXL')
</pre>

Example: mixed keyword and positional arguments (type='Monster' and argv[0]='XXXL')
<pre>
get_danger_level(type='Monster', 'XXXL')
</pre>

Positional arguments are automatically assigned to argv[] array from left to right order.

You can set default value for keyword argument with the following one line idiom in the beginning 
of the function:

<pre>
if "type" not in locals(): type='Gigalosaurus'
</pre>

Dicts with prototype creation provide "poor mans" objects :-)
<pre>
>ship={}                  # create prototype object (i.e. dict)
>ship.spd=0               # assign value to prototype
>ship.accelerate=edit()   # define function in prototype
--------------------------
me.spd+=me.acceleration  # function modifies object field
-------------------------- 
>shuttle=ship.create()    # create new object from prototype
>shuttle.acceleration=8   # set value in new object
>shuttle.accelerate()     # call new object's method (that is defined in prototype)
>print shuttle.spd
8                         # new objects field has changed...
>print ship.spd 
0                         # and prototype's fields are intact
</pre>

Dict created with dict.create() inherits its properties from prototype. Prototype dict is
used to read values if property is not defined in dict itself. Note that prototype values
are not just copied at creation time, but also changes in prototype values are reflected 
to the created dict unless it has already defined the value itself. However, writing values 
to created dict never modify the prototype dict.

Admiral has three different types of built-in functionalities:  statements, global functions 
and class functions. E.g. print and run are stetements, len() and mem() are global functions, 
and str.encrypt() is a class functions.

Admiral programmer can write global functions and dict class functions. New statements or
functions to other class types cannot be added. Global functions are variables that have 
string value and class functions can be defined for dicts by adding function with str key.

Example: global function
<pre>
>out="print argv[0]"
>out("Hello")
Hello
</pre>

Example: class function
<pre>
>a={}
>a.out="print argv[0]"
>a.out("Hello")
Hello
</pre>

--

<h4 id="4">Data types</h4>

Admiral provides some built-in data types i.e. dict, list, tuple, str, int, float and boolean.

<h5 id="4.1">Numbers</h5>

The Admiral interpreter acts as a simple calculator: you can type 'print' and an expression at it and it 
will write the value. Expression syntax is straightforward: the operators +, -, * and / work just like 
in most other languages (for example, Pascal or C); parentheses can be used for grouping. For example:

<pre>
>print 2+2
4
># This is a comment
>print 2+2 # and a comment on the same line as code
4
>print (50-5*6)/4
5
># Integer division returns the number closer to 0:
>print 7/3
2
>print 7/-3
-2
</pre>

The equal sign ('=') is used to assign a value to a variable.
<pre>
>width=20
>height=5*9
>width*height
</pre>

Admiral treats an assignment as both an expression and as a statement. As an expression, its 
value is the value assigned to the variable. This is done to allow multiple assignments in a 
single statement, such as 
<pre>
>x=y=z=0  # Zero x, y and z
>print x,y,z
0 0 0
</pre>

Variables must be “defined” (assigned a value) before they can be used, or an error will occur:
<pre>
>n  # try to access an undefined variable
ERROR:2846
n
 ^
</pre>

Error codes are not yet documented and will change in every release.

There is full support for floating point; operators with mixed type operands convert the integer operand 
to floating point:

<pre>
>print 3 * 3.75 / 1.5
7.5
>print 7.0 / 2
3.5
</pre>

Floating point precision can be set during compilation time in defs.dasm16 file:
<pre>
#define FLOAT_MANTISSA_WORDS 2
</pre>

Recommended values are in range 1-4. NOTE currently only value 2 has been tested.

<h5 id="4.2">String</h5>

Besides numbers, Admiral can also manipulate strings, which can be expressed in several ways. They can be 
enclosed in single quotes or double quotes:

<pre>
>'spam eggs'
>"doesn't"
>'"Yes," he said.'
</pre>

repr() function generates strings in single quotes. 

String literals cannot span multiple lines.

The str class can be used to handle 16-bit binary data and DCPU 7-bit text. Some str functions such as 
replace or split will not work with binary data. (That will be addressed in later releases)

Strings can be concatenated (glued together) with the + operator, and repeated with *:
<pre>
>word = 'Help' + 'A'
>print word
HelpA
>print '*' + word*5 + '*'
*HelpAHelpAHelpAHelpAHelpA*
</pre>

Strings can be subscripted (indexed); like in C, the first character of a string has subscript (index) 0. 
There is no separate character type; a character is simply a string of size one. Like in Python, substrings can 
be specified with the slice notation: two indices separated by a colon.

<pre>
>print word[4]
A
>print word[0:2]
He
>print word[2:4]
lp
</pre>

Slice indices have useful defaults; an omitted first index defaults to zero, an omitted second index defaults 
to the size of the string being sliced.
<pre>
>print word[:2]    # The first two characters
He
>print word[2:]    # Everything except the first two characters
lpA
</pre>

Unlike a C string, Admiral strings cannot be changed. Assigning to an indexed position in the string results 
in an error.

However, creating a new string with the combined content is easy:
<pre>
>print 'x' + word[1:]
xelpA
>print 'Splat' + word[4]
SplatA
</pre>

Here’s a useful invariant of slice operations: s[:i] + s[i:] equals s.
<pre>
>print word[:2] + word[2:]
HelpA
>print word[:3] + word[3:]
HelpA
</pre>

Degenerate slice indices are handled gracefully: an index that is too large is replaced by the string size, 
an upper bound smaller than the lower bound returns an empty string.

<pre>
>print word[1:100]
elpA
>print repr(word[10:])
''
>print repr(word[2:1])
''
</pre>

Indices may be negative numbers, to start counting from the right. For example:
<pre>
>print word[-1]     # The last character
A
>print word[-2]     # The last-but-one character
p
>print word[-2:]    # The last two characters
pA
>print word[:-2]    # Everything except the last two characters
Hel
</pre>

But note that -0 is really the same as 0, so it does not count from the right!

Out-of-range negative slice indices are truncated, but don’t try this for single-element (non-slice) indices:

The built-in function len() returns the length of a string:
<pre>
>s = 'supercalifragilisticexpialidocious'
>len(s)
34
</pre>

Current strings do not support escape characters or output formatting. That will be fixed to future releases.

<h6>STRING API</h6>

<dl>
  <dt>str.encrypt(key)</dt>
  <dd>
    <p>
      Encrypts the string with given key using hummingbird2 codec.
    </p>
  </dd>
</dl>

<dl>
  <dt>str.decrypt(key)</dt>
  <dd>
    <p>
      Decrypts encrypted string with given key and hummingbird2 codec.
    </p>
  </dd>
</dl>

<dl>
  <dt>str.lower()</dt>
  <dd>
    <p>
      Return a copy of the string with all the cased characters converted to lowercase.
    </p>
  </dd>
</dl>

<dl>
  <dt>str.upper()</dt>
  <dd>
    <p>
      Return a copy of the string with all the cased characters converted to uppercase.
    </p>
  </dd>
</dl>

<dl>
  <dt>str.find(sub[, start[, end]])</dt>
  <dd>
    <p>
      Return the lowest index in the string where substring sub is found, such that sub is contained in the slice 
      s[start:end]. Optional arguments start and end are interpreted as in slice notation. Return -1 if sub is not found.
    </p>
    <p>
      The find() method should be used only if you need to know the position of sub. To check if sub is a substring 
      or not, use the in operator:
      <pre>
          >"mi" in "Admiral"
          True
      </pre>
    </p>
  </dd>
</dl>

<dl>
  <dt>str.replace(old, new)</dt>
  <dd>
    <p>
      Return a copy of the string with all occurrences of substring old replaced by new.
    </p>
  </dd>
</dl>

<dl>
  <dt>str.split([sep])</dt>
  <dd>
    <p>
      Return a list of the words in the string, using sep as the delimiter string. Consecutive delimiters are not 
      grouped together and are deemed to delimit empty strings:
      <pre>
          >'1,,2'.split(',')
          ['1','','2'])
      </pre>
      The sep argument may consist of multiple characters
      <pre>
          >'1<>2<>3'.split('<>')
          ['1','2','3']). 
      </pre>
      Splitting an empty string with a specified separator returns [''].
    </p>
    <p>
      If sep is not specified, a different splitting algorithm is applied: runs of consecutive whitespace are regarded 
      as a single separator, and the result will contain no empty strings at the start or end if the string has leading 
      or trailing whitespace. Consequently, splitting an empty string or a string consisting of just whitespace with 
      a None separator returns [].
      <pre>
          >' 1  2   3  '.split()
          ['1','2','3']
      </pre>
    </p>
  </dd>
</dl>

<dl>
  <dt>str.endswith(suffix)</dt>
  <dd>
    <p>
      Return True if the string ends with the specified suffix, otherwise return False. suffix can also be a tuple 
      of suffixes to look for.
    </p>
  </dd>
</dl>

<dl>
  <dt>str.startswith(prefix)</dt>
  <dd>
    <p>
      Return True if string starts with the prefix, otherwise return False. prefix can also be a tuple of prefixes to 
      look for.
    </p>
  </dd>
</dl>

<dl>
  <dt>str.isalpha()</dt>
  <dd>
    <p>
      Return true if all characters in the string are alphabetic and there is at least one character, false otherwise.
    </p>
  </dd>
</dl>

<dl>
  <dt>str.isdigit()</dt>
  <dd>
    <p>
      Return true if all characters in the string are digits and there is at least one character, false otherwise.
    </p>
  </dd>
</dl>

<h5 id="4.3">Dictionary</h5>

Another useful data type built into Admiral is the dictionary. Dictionaries are sometimes found in other languages 
as “associative memories” or “associative arrays”. Unlike sequences, which are indexed by a range of numbers, 
dictionaries are indexed by keys, which can be strings or numbers. Tuples can not be used as keys as they can 
contain other mutable types.

It is best to think of a dictionary as an unordered set of key: value pairs, with the requirement that the keys are 
unique (within one dictionary). A pair of braces creates an empty dictionary: {}. 

<pre>
>d = {}
</pre>

Placing a comma-separated list of key:value pairs within the braces adds initial key:value pairs to the dictionary; 

<pre>
>d = {1: 2, 'Hi': [5,4,3,2,1]}
</pre>

this is also the way dictionaries are written on output.

<pre>
>print d
{1: 2, 'Hi': [5,4,3,2,1]}
</pre>

The main operations on a dictionary are storing a value with some key and extracting the value given the key. Admiral
supports multiple formats to store key-value pair:

<pre>
>d={}
>d[1]=3
>d.one=1
>d["two"]=2
>print d
{1: 3, 'one':1, 'two': 2}
</pre>

It is also possible to delete a key:value pair with del. If you store using a key that is already in use, the old 
value associated with that key is forgotten. It is an error to extract a value using a non-existent key.

<pre>
>del d[1]
>print d
>{'one':1, 'two': 2}
</pre>

<h6>DICT API</h6>

<dl>
  <dt>dict.create()</dt>
  <dd>
    <p>
      Return a new dict object that has the existing dict set as prototype.
    </p>
  </dd>
</dl>

<dl>
  <dt>dict.me</dt>
  <dd>
    <p>
      If function is called via dict reference e.g. dict.hello() then "me" keyword can be used to access 
      the properties of the referenced dict inside that function.
      <pre>
      >d={'hello': 'print me.value', 'value':10}
      >d.hello()
      10
      </pre>
    </p>
  </dd>
</dl>

<h5 id="4.4">List</h5>

The list is a versatile datatype which can be written as a list of comma-separated values (items) between square brackets. 
Important thing about a list is that items in a list need not be of the same type.

Creating a list is as simple as putting different comma-separated values between square brackets. For example −

<pre>
>l1=['Sun','Alpha Centauri',2085,16.7]
>l2=[1,2,3,4,5]
>l3=["a","b","c","d"]
</pre>

Similar to string indices, list indices start at 0, and lists can be sliced, concatenated and so on.

To access values in lists, use the square brackets for slicing along with the index or indices to obtain value available at 
that index. For example −

<pre>
>print l1[0]
Sun
>print l2[1:5]
[2,3,4,5]
</pre>

You can update single or multiple elements of lists by giving the index on the left-hand side of the assignment operator, 
and you can add to elements in a list with the append() method. For example −

<pre>
>l2[2]=2001
>print l[2]
2001
</pre>

To remove a list element, you can use the del statement, but you must know the index of the element which you are deleting. 
For example −

<pre>
>del l1[1];
>print l1
['Sun',2085,16.7]
</pre>

Lists respond to the + and * operators much like strings; they mean concatenation and repetition here too, except that 
the result is a new list, not a string.

<table cellpadding="1">
<tr><th>Expression</th><th>Results</th><th>Description</th></tr>
<tr><td>len([1, 2, 3])</td><td>3</td><td>Length</td></tr>
<tr><td>[1, 2, 3] + [4, 5, 6]</td><td>[1, 2, 3, 4, 5, 6]</td><td>Concatenation</td></tr>
<tr><td>['Hi!'] * 4</td><td>['Hi!', 'Hi!', 'Hi!', 'Hi!']</td><td>Repetition</td></tr>
<tr><td>3 in [1, 2, 3]</td><td>true</td><td>Membership</td></tr>
<tr><td>for x in [1, 2, 3]: print x</td><td>1 2 3</td><td>Iteration</td></tr>
</table>

<h6>LIST API</h6>

<dl>
  <dt>list.append(x)</dt>
  <dd>
    <p>
      Add an item to the end of the list.
    </p>
  </dd>
</dl>

<dl>
  <dt>list.insert(int, obj)</dt>
  <dd>
    <p>
      Insert an item at a given position. The first argument is the index of the element before which to insert, 
      so a.insert(0, x) inserts at the front of the list, and a.insert(len(a), x) is equivalent to a.append(x).
    </p>
  </dd>
</dl>

<h5 id="4.5">Tuple</h5>

TODO

<h5 id="4.6">Boolean</h5>

Admiral uses boolean variables to evaluate conditions. The boolean values true and false are returned when an 
expression is compared or evaluated.

<h5 id="4.7">None</h5>

None is frequently used to represent the absence of a value, as when default arguments are not passed to a function.

--

<h4 id="5">Statements</h4>

Here is a complete list of all the Admiral's statements.

<h5 id="5.1">Simple statements</h5>

Simple statements are comprised within a single line.

<h6>pass</h6>
<pre>
pass_stmt ::=  "pass"
</pre>

pass is a null operation — when it is executed, nothing happens. It is useful as a placeholder when 
a statement is required syntactically, but no code needs to be executed, for example:

<pre>
while not getchar()=='y': pass
</pre>

<h6>return</h6>
<pre>
return_stmt ::=  "return" [expression]
</pre>

return may only occur in a function. If an expression is present, it is evaluated, else None is substituted.
return leaves the current function call with the expression (or None) as return value.

<h6>break</h6>
<pre>
break_stmt ::=  "break"
</pre>

break may only occur syntactically nested in a for or while loop. break terminates the nearest enclosing loop.

<h6>continue</h6>
<pre>
continue_stmt ::=  "continue"
</pre>

continue may only occur syntactically nested in a for or while loop. It continues with the next cycle of 
the nearest enclosing loop.

<h6>print</h6>
<pre>
print_stmt ::=  "print" [expression ([","] expression)* ]
</pre>

print evaluates each expression in turn and writes the resulting object to LEM screen. If an object is not 
a string, it is first converted to a string using the rules for string conversions. A space is written 
between each object separated by comma. You can also leave out the comma, but then items are written without 
separator.

e.g.
<pre>
>print "Hello", "World"
Hello World
>print "Hello" "World"
HelloWorld
>name="Orlof"
'Orlof'
>print "My name is " name "."
My name is Orlof.
</pre>

Usage of plus operator to concatenate string in print statement is not recommended as it is much slower 
than using comma or implicit concatenation.

<pre>
>print "This", "is", "good"
This is good
>print "This" + " " + "is" + " " + "BAD!"
This is BAD!
</pre>

<h6>del</h6>
<pre>
del_stmt ::=  "del" target_list
</pre>

Deletion removes the binding of that name from the local or global namespace. If the name is unbound, 
an error will be raised.

Deletion of attribute reference removes the attribute from the primary object involved

<h6>cls</h6>
<pre>
cls_stmt ::=  "cls"
</pre>

cls (for clear screen) is a command used by the command line interpreter to clear the LEM1802 
screen and restore cursor to top left -corner position.

<h6>reset</h6>
<pre>
reset_stmt ::=  "reset"
</pre>

routine that resets the Admiral interpreter and peripheral devices (as if it were turned off and then 
on again). This command retains the data that is stored into global scope!

<h6>run</h6>
<pre>
run_stmt ::=  "run" [filename [args] ]
filename ::=  expression
args ::= expression*
</pre>

routine that loads Admiral object serialization graph from file and executes it with given arguments. 
if filename is omitted, "MAIN" is used. Object serialization graph can be either dict or string.
String object is executed directly and in dict object execution start point is value associated
with key "main".

<h5 id="5.2">Compound statements</h5>

Compound statements contain other statements; they affect or control the execution of those other 
statements in some way. In general, compound statements span multiple lines, although in simple 
incarnations a whole compound statement may be contained in one line.

The if, while and for statements implement traditional control flow constructs.

Compound statements consist of one or more ‘clauses.’ A clause consists of a header and a ‘suite.’ 
Each clause header begins with a uniquely identifying keyword and ends with a colon. A suite is a group 
of statements controlled by a clause. A suite can be one simple statements on the same line as the header, 
following the header’s colon, or it can be one or more indented statements on subsequent lines. Only
the latter form of suite can contain nested compound statements, mostly because it wouldn’t be clear 
to which if clause else clause would belong.

All compound statements are executed in a block scope. Compound statements can use the enclosing scope
(i.e. read and assign values to variables that are alrady defined in the enclosing scope) but all variables
that are defined in the compound statement are discarded when control exits the compound statement's block scope. 

NOTE: To help fitting source code into LEM 32x12 screen, INDENT and DEDENT MUST always BE a SINGLE SPACE!

<h6>if</h6>

The if statement is used for conditional execution:

<pre>
if_stmt ::=  "if" expression ":" suite
             ( "elif" expression ":" suite )*
             ["else" ":" suite]
</pre>

It selects exactly one of the suites by evaluating the expressions one by one until one is found to be 
true (see section Boolean operations for the definition of true and false); then that suite is executed
(and no other part of the if statement is executed or evaluated). If all expressions are false, the 
suite of the else clause, if present, is executed.

<h6>while</h6>

The while statement is used for repeated execution as long as an expression is true:

<pre>
while_stmt ::=  "while" expression ":" suite
</pre>

This repeatedly tests the expression and, if it is true, executes the suite; if the expression 
is false (which may be the first time it is tested) the loop terminates.

A break statement executed in the suite terminates the loop. A continue statement executed in the suite
skips the rest of the suite and goes back to testing the expression.

<h6>for</h6>

The for statement is used to iterate over the elements of a string, tuple, list or dict.

<pre>
for_stmt ::=  "for" target_list "in" expression_list ":" suite
</pre>

The expression list is evaluated once. The suite is then executed once for each item provided by the 
expression list in the order of ascending indices. Each item in turn is assigned to the target list 
using the standard rules for assignments, and then the suite is executed. When the items are exhausted 
the loop terminates.

A break statement executed in the suite terminates the loop. A continue statement executed in the suite
skips the rest of the suite and continues with the next item, or terminates if there was no next item.

The suite may assign to the variable(s) in the target list; this does not affect the next item assigned to it.

Hint: the built-in function range() returns a sequence of integers suitable to emulate the effect of Pascal’s 
for i := a to b do; e.g., range(3) returns the list [0, 1, 2].

--

<h4 id="6">Global functions</h4>

<ul>
  <li>Generic functions
    <ul>
      <li><a href="#cmp">cmp()</a></li>
      <li><a href="#len">len()</a></li>
      <li><a href="#range">range()</a></li>
      <li><a href="#sort">sort()</a></li>
      <li><a href="#type">type()</a></li>
    </ul>
  </li>
  <li>Numeric functions
    <ul>
      <li><a href="#abs">abs()</a></li>
      <li><a href="#rnd">rnd()</a></li>
    </ul>
  </li>
  <li>Character functions
    <ul>
      <li><a href="#ord">ord()</a></li>
      <li><a href="#chr">chr()</a></li>
      <li><a href="#getc">getc()</a></li>
      <li><a href="#key">key()</a></li>
    </ul>
  </li>
  <li>User input / output functions
    <ul>
      <li><a href="#input">input()</a></li>
      <li><a href="#edit">edit()</a></li>
      <li><a href="#repr">repr()</a></li>
      <li><a href="#hex">hex()</a></li>
      <li><a href="#wget">wget()</a></li>
      <li><a href="#wset">wset()</a></li>
      <li><a href="#cursor">cursor()</a></li>
      <li><a href="#scroll">scroll()</a></li>
    </ul>
  </li>
  <li>Memory functions
    <ul>
      <li><a href="#id">id()</a></li>
      <li><a href="#mem">mem()</a></li>
      <li><a href="#locals">locals()</a></li>
      <li><a href="#globals">globals()</a></li>
    </ul>
  </li>
  <li>Type conversion functions
    <ul>
      <li><a href="#bool">bool()</a></li>
      <li><a href="#float">float()</a></li>
      <li><a href="#int">int()</a></li>
      <li><a href="#str">str()</a></li>
    </ul>
  </li>
  <li>Floppy functions
    <ul>
      <li><a href="#format">format()</a></li>
      <li><a href="#dir">dir()</a></li>
      <li><a href="#load">load()</a></li>
      <li><a href="#save">save()</a></li>
      <li><a href="#rm">rm()</a></li>
    </ul>
  </li>
  <li>HIC functions
    <ul>
      <li><a href="#hsel">hsel()</a></li>
      <li><a href="#hinfo">hinfo()</a></li>
      <li><a href="#hrecv">hrecv()</a></li>
      <li><a href="#hsend">hsend()</a></li>
    </ul>
  </li>
  <li>Hardware functions
    <ul>
      <li><a href="#call">call()</a></li>
      <li><a href="#peek">peek()</a></li>
      <li><a href="#poke">poke()</a></li>
      <li><a href="#hwn">hwn()</a></li>
      <li><a href="#hwq">hwq()</a></li>
      <li><a href="#hwi">hwi()</a></li>
      <li><a href="#read">read()</a></li>
      <li><a href="#write">write()</a></li>
    </ul>
  </li>
</ul>

<h5>GENERIC FUNCTIONS</h5>

<dl>
  <dt id="cmp">cmp(x, y)</dt>
  <dd>
    <p>
      Compare the two objects x and y and return an integer according to the outcome. The return value is negative if x < y, zero if x == y and strictly positive if x > y.

      <ul>
        <li>Numbers are compared arithmetically</li>
        <li>Strings are compared lexicographically using the numeric equivalents (the result of the built-in function ord()) of their characters.</li>
        <li>Tuples and lists are compared lexicographically using comparison of corresponding elements. This means that to compare equal, each element must compare equal and the two sequences must be of the same type and have the same length.</li>
        <li>If not equal, the sequences are ordered the same as their first differing elements. For example, cmp([1,2,x], [1,2,y]) returns the same as cmp(x,y). If the corresponding element does not exist, the shorter sequence is ordered first (for example, [1,2] < [1,2,3]).</li>
        <li>Other objects of built-in types compare unequal unless they are the same object; the choice whether one object is considered smaller or larger than another one is made arbitrarily but consistently within one execution of a program.</li>
       </ul>
   </p>
  </dd>
</dl>

<dl>
  <dt id="len">len(S)</dt>
  <dd>
    <p>
      Return the length (the number of items) of an object. The argument may be a sequence (string, tuple or list) or a mapping (dictionary).
    </p>
  </dd>
</dl>

<dl>
  <dt id="range">range(end)</dt>
  <dt id="range">range(start, end[, step])</dt>
  <dd>
    <p>
      This is a versatile function to create lists containing arithmetic progressions. It is most often used in for loops. 
      The arguments must be plain integers. If the step argument is omitted, it defaults to 1. If the start argument is 
      omitted, it defaults to 0. The full form returns a list of plain integers [start, start + step, start + 2 * step, ...]. 
      If step is positive, the last element is the largest start + i * step less than stop; if step is negative, the last 
      element is the smallest start + i * step greater than stop. step must not be zero.
    </p>
  </dd>
</dl>

<dl>
  <dt id="sort">sort(S[, reverse])</dt>
  <dd>
    <p>
      Return a sorted version from the items in iterable. Strings and tuples are sorted by creating a new sorted iterable and lists are sorted in place. Reverse is a boolean value. If set to True, then the list elements are sorted as if each comparison were reversed.
    </p>
  </dd>
</dl>

<dl>
  <dt id="type">type(obj)</dt>
  <dd>
    <p>
      Return the type of an object. The return value is an integer specifiying the type.
    </p>
    <table cellpadding="1">
      <tr><th>Type</th><th>Value</th></tr>
      <tr><td>none</td><td>0x0080</td></tr>
      <tr><td>float</td><td>0x0040</td></tr>
      <tr><td>int</td><td>0x0020</td></tr>
      <tr><td>bool</td><td>0x0010</td></tr>
      <tr><td>str</td><td>0x0008</td></tr>
      <tr><td>tuple</td><td>0x0004</td></tr>
      <tr><td>list</td><td>0x0002</td></tr>
      <tr><td>dict</td><td>0x0001</td></tr>
    </table>
  </dd>
</dl>

<h5>NUMERIC FUNCTIONS</h5>

<dl>
  <dt id="abs">abs(x)</dt>
  <dd>
    <p>
      Return the absolute value of a number. The argument may be a plain integer or a floating point number.
    </p>
  </dd>
</dl>

<dl>
  <dt id="rnd">rnd([start[, end]])</dt>
  <dd>
    <p>
      Return the next pseudorandom number. TODO
    </p>
  </dd>
</dl>

<h5>CHARACTER FUNCTIONS</h5>

<dl>
  <dt id="ord">ord(char)</dt>
  <dd>
    <p>
      Given a string of length one, return the value of the byte. For example, ord('a') returns the integer 97. This is the
      inverse of chr().
    </p>
  </dd>
</dl>

<dl>
  <dt id="chr">chr(i)</dt>
  <dd>
    <p>
      Return a string of one character whose ASCII code is the integer i. For example, chr(97) returns the string 'a'. 
      This is the inverse of ord().
    </p>
  </dd>
</dl>

<dl>
  <dt id="getc">getc()</dt>
  <dd>
    <p>
      Blocks until user types a key and return the key typed as a string of one character.
    </p>
  </dd>
</dl>

<dl>
  <dt id="key">key([int])</dt>
  <dd>
    <p>
      Without argument return immediately the next key typed from keyboard buffer, or 0 if the buffer is empty. If int is
      specified return true if the specified key is down or false otherwise.
    </p>
  </dd>
</dl>

<h5>USER INPUT / OUTPUT FUNCTIONS</h5>

<dl>
  <dt id="input">input([str])</dt>
  <dd>
    <p>
      If str argument is present, it is written to standard output without a trailing newline. The function 
      then reads a line from input, converts it to a string (stripping a trailing newline), and returns that.
    </p>
  </dd>
</dl>

<dl>
  <dt id="edit">edit([str])</dt>
  <dd>
    <p>
      Opens interactive text editor. If the input argument is present, editor is initialized with input string.
      Editor can be used to modify the contents. Editing can be canceled by typing (press and release) CTRL followed
      by typing 'c', or confirmed by typing CTRL and 'x'. The function then converts editor contents (confirm) or the
      original input string (cancel) to a string, and returns that.
    </p>
  </dd>
</dl>

<dl>
  <dt id="repr">repr(obj)</dt>
  <dd>
    <p>
      Return a string containing a printable representation of an object. This is similar to str funtion, but surrounds
      string type values in quotes.
    </p>
  </dd>
</dl>

<dl>
  <dt id="hex">hex(int)</dt>
  <dd>
    <p>
      Convert an integer number (of any size) to a lowercase hexadecimal string prefixed with “0x”.
    </p>
  </dd>
</dl>

<dl>
  <dt id="wget">wget(int x, int y)</dt>
  <dd>
    <p>
      Return character (string of length 1) containing the character at screen coordinates x, y.
    </p>
  </dd>
</dl>

<dl>
  <dt id="wset">wset(int x, int y, char c)</dt>
  <dd>
    <p>
      Draw character (string of length 1) to screen coordinates x, y.
    </p>
  </dd>
</dl>

<dl>
  <dt id="cursor">cursor(int x, int y)</dt>
  <dd>
    <p>
      Move cursor to screen coordinates x, y. Next print statement will start from the cursor coordinates.
    </p>
  </dd>
</dl>

<dl>
  <dt id="scroll">scroll(int dx, int dy)</dt>
  <dd>
    <p>
      Scroll screen dx, dy characters. Areas that scroll in are filled with zero and appear empty on screen. 
    </p>
  </dd>
</dl>

<h5>MEMORY FUNCTIONS</h5>

<dl>
  <dt id="id">id(x)</dt>
  <dd>
    <p>
      Return the “identity” of an object. This is an integer which is guaranteed to be unique and constant for this object during its lifetime. Two objects with non-overlapping lifetimes may have the same id() value.
    </p>
  </dd>
</dl>

<dl>
  <dt id="mem">mem()</dt>
  <dd>
    <p>
      Runs the garbage collector and returns the amount of free heap space in words.

      Calling the gc method makes Admiral expend effort to recycling unused objects in order to make the memory they currently occupy available for quick reuse. When control returns from the method call, the Admiral has made a best effort to reclaim space from all discarded objects.
    </p>
  </dd>
</dl>

<dl>
  <dt id="locals">locals()</dt>
  <dd>
    <p>
      Return a dictionary representing the current local symbol table.
    </p>
  </dd>
</dl>

<dl>
  <dt id="globals">globals()</dt>
  <dd>
    <p>
      Return a dictionary representing the current global symbol table.
    </p>
  </dd>
</dl>

<h5>TYPE CONVERSION FUNCTIONS</h5>

<dl>
  <dt id="bool">bool(x)</dt>
  <dd>
    <p>
      Convert a value to a Boolean, using the standard truth testing procedure.
    </p>
    <p>
      The following values are interpreted as false: false, numeric zero of all types, 
      and empty strings and containers (including tuples, lists and dictionaries). All 
      other values are interpreted as true.
    </p>
  </dd>
</dl>

<dl>
  <dt id="int">int(x)</dt>
  <dd>
    <p>
      Convert a number or string x to an integer. If x is a number, it can be a boolean, 
      a plain integer, or a floating point number. If x is floating point, the conversion 
      truncates towards zero.
    </p>
  </dd>
</dl>

<dl>
  <dt id="float">float(x)</dt>
  <dd>
    <p>
      Convert a string or a number to floating point. If the argument is a string, it must 
      contain a possibly signed decimal or floating point number. The argument may also be 
      [+|-]nan or [+|-]inf. Otherwise, the argument may be a plain integer or a floating 
      point number, and a floating point number with the same value is returned.
    </p>
  </dd>
</dl>

<dl>
  <dt id="str">str(x)</dt>
  <dd>
    <p>
      Return a string containing an object representation of obj. For strings, this 
      returns the string itself.
    </p>
  </dd>
</dl>

<h5>FLOPPY FUNCTIONS</h5>

<dl>
  <dt id="format">format()</dt>
  <dd>
    <p>
      Format is used to initialize a DCPU M35FD floppy for use. It erases all information off the floppy.
    </p>
  </dd>
</dl>

<dl>
  <dt id="dir">dir()</dt>
  <dd>
    <p>
      The dir command returns a dictionary containing the available files in DCPU M35FD floppy.
    </p>
  </dd>
</dl>

<dl>
  <dt id="load">load(str)</dt>
  <dd>
    <p>
      The load command returns the object stored in DCPU M35FD floppy with filename str.
    </p>
  </dd>
</dl>

<dl>
  <dt id="save">save(str, obj)</dt>
  <dd>
    <p>
      The save command serializes the defined obj with filename str to DCPU M35FD floppy.
    </p>
  </dd>
</dl>

<dl>
  <dt id="rm">rm(str)</dt>
  <dd>
    <p>
      Removes serialized object with filename str from DCPU M35FD floppy and frees the reserved disk space.
    </p>
  </dd>
</dl>

<h5>HIC FUNCTIONS</h5>

HIC is a bi-directional multipurpose data port. Transmissions in either direction are independent of each other 
and can operate asynchronously of one another.

<dl>
  <dt id="hsel">int hsel()</dt>
  <dt>bool hsel(int port)</dt>
  <dd>
    <p>
      Returns the lowest port which has data available or -1 if no data is available.
      If port number is specified hsel returns true if data is available in the port, false otherwise.
    </p>
  </dd>
</dl>

<dl>
  <dt id="hinfo">str hinfo(int port)</dt>
  <dd>
    <p>
      Returns name for given port or None if port is invalid.
    </p>
  </dd>
</dl>

<dl>
  <dt id="hread">int hread(int port)</dt>
  <dd>
    <p>
      Returns an integer containing a word of data received from given port or none if no data is available. 
    </p>
  </dd>
</dl>

<dl>
  <dt id="hsend">void hsend(int port, int data)</dt>
  <dd>
    <p>
      Transmits a word of data to specified port. 
    </p>
  </dd>
</dl>

<h5>HARDWARE FUNCTIONS</h5>

<dl>
  <dt id="call">call(addr)</dt>
  <dd>
    <p>
      Hands the CPU over to a the machine language subroutine at a specific address. If address is not specified then 
      start of the floppy drive buffer is used as a default. Floppy drive buffer provides 512 words of space that is
      used only when Admiral executes floppy commands. Floppy commands will overwrite the buffer area completely.
    </p>
    <p>
      Given address should be in the range 0 thru 65535, or 0x0000 thru 0xFFFF. If the given address is outside these 
      limits, Admiral will use LSW as address.
    </p>
    <p>
      Parameters can be passed between Admiral and subroutine via registers. Before calling the specified address 
      Admiral “loads” a, b, c, x, y, z, i and j registers with the words stored at storage addresses (see table below).
    </p>
    <p>
      If or when the routine at the specified address returns control to Admiral (via an RTS instruction), Admiral 
      immediately saves the contents of the registers back into the storage addresses memory range: This can be used 
      to transfer results from the machine language routine to Admiral for further processing.

      Storage addresses:
      <pre>
      a: [0xffff]
      b: [0xffff] + 1
      c: [0xffff] + 2
      x: [0xffff] + 3
      y: [0xffff] + 4
      z: [0xffff] + 5
      i: [0xffff] + 6
      j: [0xffff] + 7
      </pre>

      Subroutine can pollute registers a-j, but must return with rts.
    </p>
  </dd>
</dl>

<dl>
  <dt id="peek">peek(addr[, len])</dt>
  <dd>
    <p>
      Returns the memory contents of the specified address, which must be in the range 0x0000 through 0xffff. 
      The int value returned will be in the range from 0x0000 thru 0xffff. If the address given exceeds the limits 
      of the memory map, Admiral will use the LSW of the address.
    </p>
    <p>
      The second form with 'length' argument returns a string that contains 'length' words copied from the memory 
      area that starts from the given address. 
    </p>
  </dd>
</dl>

<dl>
  <dt id="poke">poke(addr, val)</dt>
  <dd>
    <p>
      Changes the content of the memory. New value can be specified either as an integer or string. Integer form
      stores LSW to given addr and str form copies the str starting from the given addr.
    </p>
    <p>
      Caution: A misplaced POKE may cause the DCPU to lock up, or garble or delete the program currently in memory. 
      To restore a locked-up DCPU one has to reboot the DCPU, thereby losing any program or data in RAM! 
    </p>
  </dd>
</dl>

<dl>
  <dt id="hwn">hwn()</dt>
  <dd>
    <p>
      Returns the number of connected hardware devices.
    </p>
  </dd>
</dl>

<dl>
  <dt id="hwq">hwq(int)</dt>
  <dd>
    <p>
      Returns tuple containing three integers (hardware_id, hardware_version, manufacturer).
      <pre>
      for n in range(hwn()):
       hw=hwq(n)
       print hex(hw[0]), hex(hw[1]), hex(hw[2])
      </pre>
    </p>
  </dd>
</dl>

<dl>
  <dt id="hwi">hwi(int)</dt>
  <dd>
    <p>
      Sends the interrupt to hardware n.
    </p>
    <p>
      Parameters can be passed between Admiral and interrupt via registers. Before interrupt Admiral “loads” 
      a, b, c, x, y, z, i and j registers with the words stored at storage addresses (see call()).
    </p>
    <p>
      If or when the interrupt returns control, Admiral immediately saves the contents of the registers back 
      into the storage addresses memory range: This can be used to transfer results from the interrupt to 
      Admiral for further processing. 
    </p>
  </dd>
</dl>

<dl>
  <dt id="read">read(int)</dt>
  <dd>
    <p>
      Reads a single sector from floppy and stores it to floppy buffer (0xd980 - 0xdb7f in current build).
      This method is provided for integrating with non-Admiral floppy formats.
    </p>
  </dd>
</dl>

<dl>
  <dt id="write">write(int)</dt>
  <dd>
    <p>
      Writes a single sector to floppy from floppy buffer (0xd980 - 0xdb7f in current build).
      This method is provided for integrating with non-Admiral floppy formats.
    </p>
  </dd>
</dl>

<h4 id="7">Appendixes</h4>

<h5>EXPRESSION PRECEDENCE TABLE</h5>
<table cellpadding="1">
<tr><th>OPERATOR</th><th>DESCRIPTION</th><th>ASSOCIATIVITY</th></tr>
<tr><td>=, +=, -=, *=, /=, %=, **=, &gt;&gt;=, &lt;&lt;=, &=, ^=, %=</td><td>Assignment, augmented assignments</td><td>Right</td></tr>
<tr><td>,</td><td>Comma</td><td>Left</td></tr>
<tr><td>or</td><td>Boolean OR</td><td>Left</td></tr>
<tr><td>and</td><td>Boolean AND</td><td>Left</td></tr>
<tr><td>not x</td><td>Boolean NOT (unary)</td><td>-</td></tr>
<tr><td>in, not in</td><td>Membership test</td><td>Left</td></tr>
<tr><td>is, is not</td><td>Identity tests</td><td>Left</td></tr>
<tr><td>&lt;, &lt;=, &gt;, &gt;=, &lt;&gt;, !=, ==</td><td>Comparisons</td><td>Left</td></tr>
<tr><td>|</td><td>Bitwise OR</td><td>Left</td></tr>
<tr><td>^</td><td>Bitwise XOR</td><td>Left</td></tr>
<tr><td>&</td><td>Bitwise AND</td><td>Left</td></tr>
<tr><td>&lt;&lt;, &gt;&gt;</td><td>Shifts</td><td>Left</td></tr>
<tr><td>+, -</td><td>Addition and subtraction</td><td>Left</td></tr>
<tr><td>*, /, %</td><td>Multiplication, division, remainder</td><td>Left</td></tr>
<tr><td>+x, -x</td><td>Positive, negative (unary)</td><td>-</td></tr>
<tr><td>~x</td><td>Bitwise NOT</td><td>-</td></tr>
<tr><td>**</td><td>Exponentiation</td><td>Right</td></tr>
<tr><td>x[index]</td><td>Subscription</td><td>Left</td></tr>
<tr><td>x[start:end]</td><td>Slicing</td><td>Left</td></tr>
<tr><td>x(arguments...)</td><td>Call</td><td>Left</td></tr>
<tr><td>x.attribute</td><td>Reference</td><td>Left</td></tr>
<tr><td>(expression...)</td><td>Binding or tuple display (unary)</td><td>-</td></tr>
<tr><td>[expressions...]</td><td>List display (unary)</td><td>-</td></tr>
<tr><td>{key:datum...}</td><td>Dictionary display (unary)</td><td>-</td></tr>
</table>

NOTES
 - Admiral provides optimized integer division algorithm. Based on the divident and divisor size it select one of the three different division strategies
   - 16b / 16b -> DCPU hardware supported DIV operation
   - n bit / 8 bit -> Optimized proprietary division algorithm that divides with DIV in 8 bit chunks
   - n bit / n bit -> Standard long division is used
 - Assignment is an expression, not statement
   - yelds the assigned value
   - e.g. "a = (b += 1)" is a valid command 
 - Assignment right side is alway evaluated before left side
   - e.g. "for n in range(3): a += b += 1"
     - round 1: a=1, b=1
     - round 2: a=3, b=2
     - round 3: a=6, b=3
 - Slicing is not supported as assignment left side
   - e.g. "a[1:2] = 1,2" is NOT working!
 - Boolean operators both sides are always evaluated
   - e.g. "if true or (a+=1):" will increment a with every evaluation
 - INDENT and DEDENT must be exactly one space

ADMIRAL MEMORY LAYOUT

Admiral reserves the whole DCPU memory for its use. Memory is divided into segments:

<table cellpadding="1">
<tr><th>Segment</th><th>Default size</th><th>Default location</th><th>Description</th></tr>
<tr><td>Stack</td><td>4.096</td><td>0xf000 - 0xffff</td><td>Admiral call stack to store registers and arguments</td></tr>
<tr><td>Video Memory</td><td>1.152</td><td>0xeb80 - 0xefff</td><td>Video memory for LEM</td></tr>
<tr><td>Floppy Buffer</td><td>512</td><td>0xe980 - 0xeb7f</td><td>Memory buffer used by floppy operations, default memory area for machine language subroutine calls</td></tr>
<tr><td>Heap</td><td>46.207</td><td>0x3500 - 0xe97f</td><td>Admiral heap for variables and objects</td></tr>
<tr><td>System</td><td>13.568</td><td>0x0000 - 0x34ff</td><td>Admiral interpreter, data and subroutines</td></tr>
</table>

The exact location and size of each segment depends on the Admiral build.

SOME EXTRA BITS

ASSIGNMENTS

<pre>
>a = b = 0
>a += b += 1
1
>a += b += 1
3
</pre>

Currently Admiral does not support assigning to slices: 
i.e. a[1:3]=(1,2,3) is not working. 
If that REALLY is a language feature that anyone would use, I will consider adding it :-)

UNKNOWN IDENTS IN FUNCTIONS

Currently Admiral does not produce error if unknown variable name is present in function body, but it is not
evaluated. E.g.

<pre>
>f=edit()
'print "Hello"
foobar
print "The End"
</pre>

foobar would not yeld error, as it is not used for anything. However,

<pre>
>f=edit()
'print "Hello"
foobar+1
print "The End"
</pre>

will yeld error, as unknown IDENT (foobar) cannot be evaluated for addition operator.

PYTHON FEATURES MISSING (INCOMPLETE LIST)

 - 'def' function definitions
 - 'class' class definitions
 - 'lambda' functions
 - generators
 - list comprehension e.g.  [x**2 for x in range(10)]
 - '*args' and '*kwargs'
 - % string operator
 - 'yield'
 - 'try' - 'except' exception handling
 - lot of built-in functions

