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