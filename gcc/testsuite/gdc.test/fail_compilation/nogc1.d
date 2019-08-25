// REQUIRED_ARGS: -o-
// PERMUTE_ARGS:

/***************** NewExp *******************/

struct S1 { }
struct S2 { this(int); }
struct S3 { this(int) @nogc; }
struct S4 { new(size_t); }
struct S5 { @nogc new(size_t); }

/*
TEST_OUTPUT:
---
fail_compilation/nogc1.d(27): Error: cannot use 'new' in @nogc function 'nogc1.testNew'
fail_compilation/nogc1.d(29): Error: cannot use 'new' in @nogc function 'nogc1.testNew'
fail_compilation/nogc1.d(30): Error: cannot use 'new' in @nogc function 'nogc1.testNew'
fail_compilation/nogc1.d(32): Error: cannot use 'new' in @nogc function 'nogc1.testNew'
fail_compilation/nogc1.d(33): Error: @nogc function 'nogc1.testNew' cannot call non-@nogc constructor 'nogc1.S2.this'
fail_compilation/nogc1.d(34): Error: cannot use 'new' in @nogc function 'nogc1.testNew'
fail_compilation/nogc1.d(35): Error: @nogc function 'nogc1.testNew' cannot call non-@nogc allocator 'nogc1.S4.new'
fail_compilation/nogc1.d(38): Error: cannot use 'new' in @nogc function 'nogc1.testNew'
---
*/
@nogc void testNew()
{
    int* p1 = new int;

    int[] a1 = new int[3];
    int[][] a2 = new int[][](2, 3);

    S1* ps1 = new S1();
    S2* ps2 = new S2(1);
    S3* ps3 = new S3(1);
    S4* ps4 = new S4;
    S5* ps5 = new S5;   // no error

    Object o1 = new Object();
}

/*
TEST_OUTPUT:
---
fail_compilation/nogc1.d(55): Error: cannot use 'new' in @nogc function 'nogc1.testNewScope'
fail_compilation/nogc1.d(57): Error: cannot use 'new' in @nogc function 'nogc1.testNewScope'
fail_compilation/nogc1.d(58): Error: cannot use 'new' in @nogc function 'nogc1.testNewScope'
fail_compilation/nogc1.d(60): Error: cannot use 'new' in @nogc function 'nogc1.testNewScope'
fail_compilation/nogc1.d(61): Error: @nogc function 'nogc1.testNewScope' cannot call non-@nogc constructor 'nogc1.S2.this'
fail_compilation/nogc1.d(62): Error: cannot use 'new' in @nogc function 'nogc1.testNewScope'
fail_compilation/nogc1.d(63): Error: @nogc function 'nogc1.testNewScope' cannot call non-@nogc allocator 'nogc1.S4.new'
---
*/
@nogc void testNewScope()
{
    scope int* p1 = new int;

    scope int[] a1 = new int[3];
    scope int[][] a2 = new int[][](2, 3);

    scope S1* ps1 = new S1();
    scope S2* ps2 = new S2(1);
    scope S3* ps3 = new S3(1);
    scope S4* ps4 = new S4;
    scope S5* ps5 = new S5;             // no error

    scope Object o1 = new Object();     // no error
    scope o2 = new Object();            // no error
}

/***************** DeleteExp *******************/

/*
TEST_OUTPUT:
---
fail_compilation/nogc1.d(82): Error: cannot use 'delete' in @nogc function 'nogc1.testDelete'
fail_compilation/nogc1.d(83): Error: cannot use 'delete' in @nogc function 'nogc1.testDelete'
fail_compilation/nogc1.d(84): Error: cannot use 'delete' in @nogc function 'nogc1.testDelete'
---
*/
@nogc void testDelete(int* p, Object o, S1* s)
{
    delete p;
    delete o;
    delete s;
}
