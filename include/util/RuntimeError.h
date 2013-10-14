/*
 * RuntimeError.h
 *
 *  Created on: Oct 14, 2013
 *      Author: herman
 */

#ifndef RUNTIMEERROR_H_
#define RUNTIMEERROR_H_

void RuntimeError(const char * message, int parameter, const char * file, int line);

#define RUNTIME_ERROR(description, parameter) \
	RuntimeError(description,parameter, __FILE__,__LINE__);



#endif /* RUNTIMEERROR_H_ */
