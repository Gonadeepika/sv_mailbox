# Makefile for Threads/Mailbox/Semaphore - SV Lab06

# SIMULATOR = Questa for Mentor's Questasim
# SIMULATOR = VCS for Synopsys's VCS

SIMULATOR = VCS
help:
	@echo ==========================================================================================================
	@echo "	USAGE   	--  make target										"
	@echo " clean   		=>  clean the earlier log and intermediate files.					"
	@echo " run_sim   		=>  compile & run the simulation in batch mode with test_threads.sv file.		"
	@echo " run_sim1  		=>  compile & run the simulation in batch mode with test_mailbox.sv.sv file.		"
	@echo " run_sim2  		=>  compile & run the simulation in batch mode with test_semaphore.sv file.		"
	@echo " run_thread  		=>  clean, compile & run the simulation in batch mode with test_threads.sv file.	"
	@echo " run_mailbox 		=>  clean, compile & run the simulation in batch mode with test_mailbox.sv.sv file.	"
	@echo " run_sem 		=>  clean, compile & run the simulation in batch mode with test_semaphore.sv file.	"
	@echo ==========================================================================================================

clean : clean_$(SIMULATOR)
run_sim : run_sim_$(SIMULATOR)
run_sim1 : run_sim1_$(SIMULATOR)
run_sim2 : run_sim2_$(SIMULATOR)
run_thread : run_thread_$(SIMULATOR)
run_mailbox : run_mailbox_$(SIMULATOR)
run_sem : run_sem_$(SIMULATOR)	

# ---- Start of Definitions for Mentor's Questa Specific Targets -----#

run_thread_Questa: clean_Questa run_sim_Questa

run_mailbox_Questa: clean_Questa run_sim1_Questa

run_sem_Questa: clean_Questa run_sim2_Questa

run_sim_Questa: 
	qverilog ../tb/test_threads.sv
	
run_sim1_Questa: 
	qverilog ../tb/test_mailbox.sv
	
run_sim2_Questa: 
	qverilog ../tb/test_semaphore.sv	
	
clean_Questa:
	rm -rf transcript* *log* work *.wlf fcover* covhtml* mem_cov* dff modelsim.ini 
	clear
	
# ---- End of Definitions for Mentor's Questa Specific Targets -----#	

# ---- Start of Definitions for Synopsys VCS Specific Targets -----#

run_thread_VCS: clean_VCS run_sim_VCS

run_mailbox_VCS: clean_VCS run_sim1_VCS

run_sem_VCS: clean_VCS run_sim2_VCS

run_sim_VCS: 
	vcs -l comp.log -sverilog ../tb/test_threads.sv
	./simv -l vcs.log

run_sim1_VCS: 
	vcs -l comp.log -sverilog ../tb/test_mailbox.sv
	./simv -l vcs.log

run_sim2_VCS: 
	vcs -l comp.log -sverilog ../tb/test_semaphore.sv
	./simv -l vcs.log
	
clean_VCS:
	rm -rf simv* csrc* *.tmp *.vpd *.vdb *.key *.log *hdrs.h
	clear 
	

# ---- End of Definitions for Synopsys VCS Specific Targets -----#
	
