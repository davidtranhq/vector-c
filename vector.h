#pragma once

#include <stdlib.h>
#include <assert.h>

#define CAT(a, b) a ## b
#define T(name, type) CAT(name, type) // e.g. DECLARE(vec_create_, int)
#define VEC_INITIAL_SIZE 8

typedef enum vector_errors
{
	VEC_SUCCESS,
	VEC_BAD_ALLOC,
	VEC_OUT_OF_RANGE,
} Vector_error;

/*
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
*/
