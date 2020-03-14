# vector-c
A dynamically-typed vector implementation in C.

## Usage
```
Usage:
#include "vector.h"
#define TYPE int
#include "vector.t"
#undef TYPE
#define TYPE char
#include "vector.t"
#undef TYPE
int main()
{
	Vector_int *vi;
	Vector_char *vc;
	Vector_error e;
	e = vec_create_int(&vi);
	if (e != VEC_SUCCESS)
	{
		...
	}
	e = vec_create_char(&vc);
	if (e != VEC_SUCCESS)
	{
		...
	}
	
	...
	
	vec_free_int(&vi);
	vec_free_char(&vc);
	return 0;
}
```
