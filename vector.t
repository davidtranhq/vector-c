#ifdef TYPE

typedef struct T(Vector_, TYPE)
{
	TYPE *data;
	int sz;
	int capacity;
} T(Vector_, TYPE);

Vector_error T(vec_resize_, TYPE)(T(Vector_, TYPE) **v, size_t s);

Vector_error T(vec_create_, TYPE)
(T(Vector_, TYPE) **v)
{
	*v = malloc( sizeof(T(Vector_, TYPE)) );
	if (*v == NULL)
		return VEC_BAD_ALLOC;
	(*v)->data = calloc(VEC_INITIAL_SIZE, sizeof(TYPE));
	if ( (*v)->data == NULL)
		return VEC_BAD_ALLOC;
	(*v)->sz = 0;
	(*v)->capacity = 8;
	return VEC_SUCCESS;
}

void T(vec_free_, TYPE)
(T(Vector_, TYPE) **v)
{
	free( (*v)->data );
	free(*v);
	*v = NULL;
}

Vector_error T(vec_push_back_, TYPE)
(T(Vector_, TYPE) **v, TYPE d)
{
	assert(v != NULL);
	Vector_error e;
	if ((*v)->sz == (*v)->capacity)
	{
		e = T(vec_resize_, TYPE)(v, ((*v)->capacity)*2);
		if (e != VEC_SUCCESS)
			return e;
	}
	(*v)->data[(*v)->sz] = d;
	++(*v)->sz;
	return VEC_SUCCESS;
}

void T(vec_pop_back_, TYPE)
(T(Vector_, TYPE) *v)
{
	assert(v != NULL);
	v->data[v->sz] = 0;
	--v->sz;
}

TYPE T(vec_at_, TYPE)
(T(Vector_, TYPE) *v, size_t i)
{
	assert(v != NULL);
	if (i > v->capacity)
		return VEC_OUT_OF_RANGE;
	return v->data[i];
}

Vector_error T(vec_resize_, TYPE)
(T(Vector_, TYPE) **v, size_t s)
{
	assert(v != NULL && s > 0);
	T(Vector_, TYPE) *old = *v;
	*v = realloc(*v, sizeof(TYPE)*s);
	if (*v == NULL)
	{
		*v = old;
		return VEC_BAD_ALLOC;
	}
	if (s < (*v)->sz)
		(*v)->sz = s;
	(*v)->capacity = s;
	return VEC_SUCCESS;
}

#endif