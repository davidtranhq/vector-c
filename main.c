#include <stdio.h>
#include "vector.h"

#define TYPE int
#include "vector.t"
#undef TYPE


int main()
{
	Vector_error e;
	Vector_int *v;
	e = vec_create_int(&v);
	if (e != VEC_SUCCESS)
	{
		fputs("Could not create vector!\n", stderr);
		exit(1);
	}
	for (int i = 0; i < 10; ++i)
	{
		e = vec_push_back_int(&v, i);
		if (e != VEC_SUCCESS)
		{
			fputs("Could not resize vector!\n", stderr);
			exit(1);
		}
	}
	
	int x = vec_at_int(v, 5);
	printf("Value at index 5: %d\n", x);
	
	vec_free_int(&v);
	return 0;
}