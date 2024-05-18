/********************************************************************************************

Copyright 2019 - Maven Silicon Softech Pvt Ltd.  
www.maven-silicon.com

All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.
It is not to be shared with or used by any third parties who have not enrolled for our paid 
training courses or received any written authorization from Maven Silicon.


Filename		:	test_semaphore.sv   

Description		:	Example for semaphore

Author Name		:	Putta Satish

Support e-mail  : 	For any queries, reach out to us on "techsupport_vm@maven-silicon.com" 

Version			:	1.0

*********************************************************************************************/

module test_semaphore;

	class driver;

		// write task send with input argument of string type
		task send(input string var1);

			// Get the key using sem handle 
			sem.get(1);

			// Display the string which indicates the respective driver information
			$display("%s GOT KEY",var1);
			
			// Put the key using sem handle 

			sem.put(1);

			// Display the string which indicates the respective driver information
			$display("%s DROPPED KEY",var1);
		endtask: send
  
	endclass: driver  
	// Declare an array of two drivers  

	driver drv[2];

	// Declare a handle for semaphore
	semaphore sem;

	initial
		begin
		// Create instances of drivers

			drv[0]=new();
			drv[1]=new();
		// Create the instance of semaphore handle and initialize it with 1 key

			sem=new(1);
	    
	
		// Call send task of both drivers 5 times within fork join
		// pass any meaning full string message to indicate the driver information
			repeat(5)
				begin
					fork
						drv[0].send("DRIVER--1");
						drv[1].send("DRIVER--2");
					join
				end
	end

endmodule 

