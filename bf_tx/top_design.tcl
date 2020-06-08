
################################################################
# This is a generated script based on design: top
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2018.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source top_script.tcl


# The design that will be created by this Tcl script contains the following
# module references:
# applyH, w_tx

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7vx485tffg1761-2
   set_property BOARD_PART xilinx.com:vc707:part0:1.4 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name top_tx

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES:
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\
xilinx.com:ip:clk_wiz:6.0\
xilinx.com:ip:axi_bram_ctrl:4.1\
xilinx.com:ip:blk_mem_gen:8.4\
xilinx.com:user:data_bram_controller:1.0\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:xfft:9.1\
xilinx.com:ip:axi_uartlite:2.0\
xilinx.com:ip:mdm:3.2\
xilinx.com:ip:microblaze:11.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:fifo_generator:13.2\
xilinx.com:ip:util_vector_logic:2.0\
xilinx.com:ip:lmb_bram_if_cntlr:4.0\
xilinx.com:ip:lmb_v10:3.0\
"

   set list_ips_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

##################################################################
# CHECK Modules
##################################################################
set bCheckModules 1
if { $bCheckModules == 1 } {
   set list_check_mods "\
applyH\
w_tx\
"

   set list_mods_missing ""
   common::send_msg_id "BD_TCL-006" "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_msg_id "BD_TCL-115" "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_msg_id "BD_TCL-008" "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

if { $bCheckIPsPassed != 1 } {
  common::send_msg_id "BD_TCL-1003" "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
   CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [ list \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1 [get_bd_pins SYS_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: post_ifft_fifos
proc create_hier_cell_post_ifft_fifos { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_post_ifft_fifos() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk clk_0
  create_bd_pin -dir I -from 31 -to 0 din_0
  create_bd_pin -dir I -from 31 -to 0 din_1
  create_bd_pin -dir I -from 31 -to 0 din_2
  create_bd_pin -dir I -from 31 -to 0 din_3
  create_bd_pin -dir O -from 31 -to 0 dout_0
  create_bd_pin -dir O -from 31 -to 0 dout_1
  create_bd_pin -dir O -from 31 -to 0 dout_2
  create_bd_pin -dir O -from 31 -to 0 dout_3
  create_bd_pin -dir O empty
  create_bd_pin -dir O -from 0 -to 0 not_full
  create_bd_pin -dir I rd_en_0
  create_bd_pin -dir I wr_en_0

  # Create instance: fifo_generator_0, and set properties
  set fifo_generator_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_0 ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {11} \
   CONFIG.Full_Threshold_Assert_Value {2046} \
   CONFIG.Full_Threshold_Negate_Value {2045} \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Input_Depth {2048} \
   CONFIG.Output_Data_Width {32} \
   CONFIG.Output_Depth {2048} \
   CONFIG.Read_Data_Count_Width {11} \
   CONFIG.Reset_Pin {false} \
   CONFIG.Reset_Type {Asynchronous_Reset} \
   CONFIG.Use_Dout_Reset {false} \
   CONFIG.Use_Extra_Logic {false} \
   CONFIG.Write_Data_Count_Width {11} \
 ] $fifo_generator_0

  # Create instance: fifo_generator_1, and set properties
  set fifo_generator_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_1 ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {11} \
   CONFIG.Full_Threshold_Assert_Value {2046} \
   CONFIG.Full_Threshold_Negate_Value {2045} \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Input_Depth {2048} \
   CONFIG.Output_Data_Width {32} \
   CONFIG.Output_Depth {2048} \
   CONFIG.Read_Data_Count_Width {11} \
   CONFIG.Reset_Pin {false} \
   CONFIG.Reset_Type {Asynchronous_Reset} \
   CONFIG.Use_Dout_Reset {false} \
   CONFIG.Use_Extra_Logic {false} \
   CONFIG.Write_Data_Count_Width {11} \
 ] $fifo_generator_1

  # Create instance: fifo_generator_2, and set properties
  set fifo_generator_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_2 ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {11} \
   CONFIG.Full_Threshold_Assert_Value {2046} \
   CONFIG.Full_Threshold_Negate_Value {2045} \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Input_Depth {2048} \
   CONFIG.Output_Data_Width {32} \
   CONFIG.Output_Depth {2048} \
   CONFIG.Read_Data_Count_Width {11} \
   CONFIG.Reset_Pin {false} \
   CONFIG.Reset_Type {Asynchronous_Reset} \
   CONFIG.Use_Dout_Reset {false} \
   CONFIG.Use_Extra_Logic {false} \
   CONFIG.Write_Data_Count_Width {11} \
 ] $fifo_generator_2

  # Create instance: fifo_generator_3, and set properties
  set fifo_generator_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_3 ]
  set_property -dict [ list \
   CONFIG.Data_Count_Width {11} \
   CONFIG.Full_Threshold_Assert_Value {2046} \
   CONFIG.Full_Threshold_Negate_Value {2045} \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Input_Depth {2048} \
   CONFIG.Output_Data_Width {32} \
   CONFIG.Output_Depth {2048} \
   CONFIG.Read_Data_Count_Width {11} \
   CONFIG.Reset_Pin {false} \
   CONFIG.Reset_Type {Asynchronous_Reset} \
   CONFIG.Use_Dout_Reset {false} \
   CONFIG.Use_Extra_Logic {false} \
   CONFIG.Write_Data_Count_Width {11} \
 ] $fifo_generator_3

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list \
   CONFIG.C_OPERATION {not} \
   CONFIG.C_SIZE {1} \
   CONFIG.LOGO_FILE {data/sym_notgate.png} \
 ] $util_vector_logic_1

  # Create port connections
  connect_bd_net -net clk_0_1 [get_bd_pins clk_0] [get_bd_pins fifo_generator_0/clk] [get_bd_pins fifo_generator_1/clk] [get_bd_pins fifo_generator_2/clk] [get_bd_pins fifo_generator_3/clk]
  connect_bd_net -net din_0_1 [get_bd_pins din_0] [get_bd_pins fifo_generator_0/din]
  connect_bd_net -net din_1_1 [get_bd_pins din_1] [get_bd_pins fifo_generator_1/din]
  connect_bd_net -net din_2_1 [get_bd_pins din_2] [get_bd_pins fifo_generator_2/din]
  connect_bd_net -net din_3_1 [get_bd_pins din_3] [get_bd_pins fifo_generator_3/din]
  connect_bd_net -net fifo_generator_0_dout [get_bd_pins dout_0] [get_bd_pins fifo_generator_0/dout]
  connect_bd_net -net fifo_generator_0_empty [get_bd_pins empty] [get_bd_pins fifo_generator_0/empty]
  connect_bd_net -net fifo_generator_0_full [get_bd_pins fifo_generator_0/full] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net fifo_generator_1_dout [get_bd_pins dout_1] [get_bd_pins fifo_generator_1/dout]
  connect_bd_net -net fifo_generator_2_dout [get_bd_pins dout_2] [get_bd_pins fifo_generator_2/dout]
  connect_bd_net -net fifo_generator_3_dout [get_bd_pins dout_3] [get_bd_pins fifo_generator_3/dout]
  connect_bd_net -net rd_en_0_1 [get_bd_pins rd_en_0] [get_bd_pins fifo_generator_0/rd_en] [get_bd_pins fifo_generator_1/rd_en] [get_bd_pins fifo_generator_2/rd_en] [get_bd_pins fifo_generator_3/rd_en]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins not_full] [get_bd_pins util_vector_logic_1/Res]
  connect_bd_net -net wr_en_0_1 [get_bd_pins wr_en_0] [get_bd_pins fifo_generator_0/wr_en] [get_bd_pins fifo_generator_1/wr_en] [get_bd_pins fifo_generator_2/wr_en] [get_bd_pins fifo_generator_3/wr_en]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_stuff
proc create_hier_cell_microblaze_stuff { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_microblaze_stuff() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M01_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M02_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M03_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M04_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 rs232_uart

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir O -from 0 -to 0 -type rst S00_ARESETN
  create_bd_pin -dir I dcm_locked
  create_bd_pin -dir I -type rst reset

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.UARTLITE_BOARD_INTERFACE {rs232_uart} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $axi_uartlite_0

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0 ]
  set_property -dict [ list \
   CONFIG.C_DEBUG_ENABLED {1} \
   CONFIG.C_D_AXI {1} \
   CONFIG.C_D_LMB {1} \
   CONFIG.C_I_LMB {1} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
   CONFIG.NUM_MI {6} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory $hier_obj microblaze_0_local_memory

  # Create instance: rst_clk_wiz_1_100M, and set properties
  set rst_clk_wiz_1_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_1_100M ]
  set_property -dict [ list \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $rst_clk_wiz_1_100M

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins rs232_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DP [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins M01_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins M02_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins M03_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins M04_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]

  # Create port connections
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins dcm_locked] [get_bd_pins rst_clk_wiz_1_100M/dcm_locked]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins rst_clk_wiz_1_100M/slowest_sync_clk]
  connect_bd_net -net reset_1 [get_bd_pins reset] [get_bd_pins rst_clk_wiz_1_100M/ext_reset_in]
  connect_bd_net -net rst_clk_wiz_1_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_clk_wiz_1_100M/bus_struct_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins rst_clk_wiz_1_100M/mb_reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins S00_ARESETN] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rst_clk_wiz_1_100M/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: iffts
proc create_hier_cell_iffts { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_iffts() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I -type clk aclk_0
  create_bd_pin -dir O -from 31 -to 0 m_axis_data_tdata
  create_bd_pin -dir O -from 31 -to 0 m_axis_data_tdata1
  create_bd_pin -dir O -from 31 -to 0 m_axis_data_tdata2
  create_bd_pin -dir O -from 31 -to 0 m_axis_data_tdata3
  create_bd_pin -dir I m_axis_data_tready
  create_bd_pin -dir O m_axis_data_tvalid
  create_bd_pin -dir O s_axis_config_tready
  create_bd_pin -dir I s_axis_config_tvalid
  create_bd_pin -dir I -from 31 -to 0 s_axis_data_tdata
  create_bd_pin -dir I -from 31 -to 0 s_axis_data_tdata1
  create_bd_pin -dir I -from 31 -to 0 s_axis_data_tdata2
  create_bd_pin -dir I -from 31 -to 0 s_axis_data_tdata3
  create_bd_pin -dir I s_axis_data_tlast
  create_bd_pin -dir O s_axis_data_tready
  create_bd_pin -dir I s_axis_data_tvalid

  # Create instance: xfft_0, and set properties
  set xfft_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_0 ]
  set_property -dict [ list \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {3} \
   CONFIG.output_ordering {natural_order} \
 ] $xfft_0

  # Create instance: xfft_1, and set properties
  set xfft_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_1 ]
  set_property -dict [ list \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {3} \
   CONFIG.output_ordering {natural_order} \
 ] $xfft_1

  # Create instance: xfft_2, and set properties
  set xfft_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_2 ]
  set_property -dict [ list \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {3} \
   CONFIG.output_ordering {natural_order} \
 ] $xfft_2

  # Create instance: xfft_3, and set properties
  set xfft_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_3 ]
  set_property -dict [ list \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {3} \
   CONFIG.output_ordering {natural_order} \
 ] $xfft_3

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {b0000000100101110} \
   CONFIG.CONST_WIDTH {16} \
 ] $xlconstant_1

  # Create port connections
  connect_bd_net -net aclk_0_1 [get_bd_pins aclk_0] [get_bd_pins xfft_0/aclk] [get_bd_pins xfft_1/aclk] [get_bd_pins xfft_2/aclk] [get_bd_pins xfft_3/aclk]
  connect_bd_net -net m_axis_data_tready_1 [get_bd_pins m_axis_data_tready] [get_bd_pins xfft_0/m_axis_data_tready] [get_bd_pins xfft_1/m_axis_data_tready] [get_bd_pins xfft_2/m_axis_data_tready] [get_bd_pins xfft_3/m_axis_data_tready]
  connect_bd_net -net s_axis_config_tdata_1 [get_bd_pins xfft_0/s_axis_config_tdata] [get_bd_pins xfft_1/s_axis_config_tdata] [get_bd_pins xfft_2/s_axis_config_tdata] [get_bd_pins xfft_3/s_axis_config_tdata] [get_bd_pins xlconstant_1/dout]
  connect_bd_net -net s_axis_config_tvalid_1 [get_bd_pins s_axis_config_tvalid] [get_bd_pins xfft_0/s_axis_config_tvalid] [get_bd_pins xfft_1/s_axis_config_tvalid] [get_bd_pins xfft_2/s_axis_config_tvalid] [get_bd_pins xfft_3/s_axis_config_tvalid]
  connect_bd_net -net s_axis_data_tdata1_1 [get_bd_pins s_axis_data_tdata1] [get_bd_pins xfft_1/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata2_1 [get_bd_pins s_axis_data_tdata2] [get_bd_pins xfft_2/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata3_1 [get_bd_pins s_axis_data_tdata3] [get_bd_pins xfft_3/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tdata_1 [get_bd_pins s_axis_data_tdata] [get_bd_pins xfft_0/s_axis_data_tdata]
  connect_bd_net -net s_axis_data_tlast_1 [get_bd_pins s_axis_data_tlast] [get_bd_pins xfft_0/s_axis_data_tlast] [get_bd_pins xfft_1/s_axis_data_tlast] [get_bd_pins xfft_2/s_axis_data_tlast] [get_bd_pins xfft_3/s_axis_data_tlast]
  connect_bd_net -net s_axis_data_tvalid_1 [get_bd_pins s_axis_data_tvalid] [get_bd_pins xfft_0/s_axis_data_tvalid] [get_bd_pins xfft_1/s_axis_data_tvalid] [get_bd_pins xfft_2/s_axis_data_tvalid] [get_bd_pins xfft_3/s_axis_data_tvalid]
  connect_bd_net -net xfft_0_m_axis_data_tdata [get_bd_pins m_axis_data_tdata] [get_bd_pins xfft_0/m_axis_data_tdata]
  connect_bd_net -net xfft_0_m_axis_data_tvalid [get_bd_pins m_axis_data_tvalid] [get_bd_pins xfft_0/m_axis_data_tvalid]
  connect_bd_net -net xfft_0_s_axis_config_tready [get_bd_pins s_axis_config_tready] [get_bd_pins xfft_0/s_axis_config_tready]
  connect_bd_net -net xfft_0_s_axis_data_tready [get_bd_pins s_axis_data_tready] [get_bd_pins xfft_0/s_axis_data_tready]
  connect_bd_net -net xfft_1_m_axis_data_tdata [get_bd_pins m_axis_data_tdata1] [get_bd_pins xfft_1/m_axis_data_tdata]
  connect_bd_net -net xfft_2_m_axis_data_tdata [get_bd_pins m_axis_data_tdata2] [get_bd_pins xfft_2/m_axis_data_tdata]
  connect_bd_net -net xfft_3_m_axis_data_tdata [get_bd_pins m_axis_data_tdata3] [get_bd_pins xfft_3/m_axis_data_tdata]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: data_bram_controller
proc create_hier_cell_data_bram_controller { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_data_bram_controller() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI2
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI3

  # Create pins
  create_bd_pin -dir O -from 31 -to 0 doutb
  create_bd_pin -dir O -from 31 -to 0 doutb1
  create_bd_pin -dir O -from 31 -to 0 doutb2
  create_bd_pin -dir O -from 31 -to 0 doutb3
  create_bd_pin -dir I ifft_s_axis_config_tready_0
  create_bd_pin -dir O ifft_s_axis_config_tvalid_0
  create_bd_pin -dir O ifft_s_axis_data_tlast_0
  create_bd_pin -dir I ifft_s_axis_data_tready_0
  create_bd_pin -dir O ifft_s_axis_data_tvalid_0
  create_bd_pin -dir I -type clk s00_axi_aclk
  create_bd_pin -dir I -type rst s00_axi_aresetn

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

  # Create instance: axi_bram_ctrl_1, and set properties
  set axi_bram_ctrl_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_1 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_1

  # Create instance: axi_bram_ctrl_2, and set properties
  set axi_bram_ctrl_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_2 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_2

  # Create instance: axi_bram_ctrl_3, and set properties
  set axi_bram_ctrl_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_3 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_3

  # Create instance: blk_mem_gen_0, and set properties
  set blk_mem_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_0 ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $blk_mem_gen_0

  # Create instance: blk_mem_gen_1, and set properties
  set blk_mem_gen_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_1 ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $blk_mem_gen_1

  # Create instance: blk_mem_gen_2, and set properties
  set blk_mem_gen_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_2 ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $blk_mem_gen_2

  # Create instance: blk_mem_gen_3, and set properties
  set blk_mem_gen_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 blk_mem_gen_3 ]
  set_property -dict [ list \
   CONFIG.EN_SAFETY_CKT {false} \
   CONFIG.Enable_B {Use_ENB_Pin} \
   CONFIG.Memory_Type {True_Dual_Port_RAM} \
   CONFIG.Port_B_Clock {100} \
   CONFIG.Port_B_Enable_Rate {100} \
   CONFIG.Port_B_Write_Rate {50} \
   CONFIG.Use_RSTB_Pin {true} \
 ] $blk_mem_gen_3

  # Create instance: data_bram_controller_0, and set properties
  set data_bram_controller_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:data_bram_controller:1.0 data_bram_controller_0 ]

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {4} \
 ] $xlconstant_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_1_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_1/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_1/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_2_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_2/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_2/BRAM_PORTA]
  connect_bd_intf_net -intf_net axi_bram_ctrl_3_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_3/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_3/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M00_AXI [get_bd_intf_pins S00_AXI] [get_bd_intf_pins data_bram_controller_0/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins S_AXI1] [get_bd_intf_pins axi_bram_ctrl_1/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins S_AXI2] [get_bd_intf_pins axi_bram_ctrl_2/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins S_AXI3] [get_bd_intf_pins axi_bram_ctrl_3/S_AXI]

  # Create port connections
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_pins doutb] [get_bd_pins blk_mem_gen_0/doutb]
  connect_bd_net -net blk_mem_gen_1_doutb [get_bd_pins doutb1] [get_bd_pins blk_mem_gen_1/doutb]
  connect_bd_net -net blk_mem_gen_2_doutb [get_bd_pins doutb2] [get_bd_pins blk_mem_gen_2/doutb]
  connect_bd_net -net blk_mem_gen_3_doutb [get_bd_pins doutb3] [get_bd_pins blk_mem_gen_3/doutb]
  connect_bd_net -net data_bram_controller_0_addr [get_bd_pins blk_mem_gen_0/addrb] [get_bd_pins blk_mem_gen_1/addrb] [get_bd_pins blk_mem_gen_2/addrb] [get_bd_pins blk_mem_gen_3/addrb] [get_bd_pins data_bram_controller_0/addr]
  connect_bd_net -net data_bram_controller_0_en [get_bd_pins blk_mem_gen_0/enb] [get_bd_pins blk_mem_gen_1/enb] [get_bd_pins blk_mem_gen_2/enb] [get_bd_pins blk_mem_gen_3/enb] [get_bd_pins data_bram_controller_0/en]
  connect_bd_net -net data_bram_controller_0_ifft_s_axis_config_tvalid_0 [get_bd_pins ifft_s_axis_config_tvalid_0] [get_bd_pins data_bram_controller_0/ifft_s_axis_config_tvalid_0]
  connect_bd_net -net data_bram_controller_0_ifft_s_axis_data_tlast_0 [get_bd_pins ifft_s_axis_data_tlast_0] [get_bd_pins data_bram_controller_0/ifft_s_axis_data_tlast_0]
  connect_bd_net -net data_bram_controller_0_ifft_s_axis_data_tvalid_0 [get_bd_pins ifft_s_axis_data_tvalid_0] [get_bd_pins data_bram_controller_0/ifft_s_axis_data_tvalid_0]
  connect_bd_net -net iffts_s_axis_config_tready [get_bd_pins ifft_s_axis_config_tready_0] [get_bd_pins data_bram_controller_0/ifft_s_axis_config_tready_0]
  connect_bd_net -net iffts_s_axis_data_tready [get_bd_pins ifft_s_axis_data_tready_0] [get_bd_pins data_bram_controller_0/ifft_s_axis_data_tready_0]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins s00_axi_aclk] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins axi_bram_ctrl_1/s_axi_aclk] [get_bd_pins axi_bram_ctrl_2/s_axi_aclk] [get_bd_pins axi_bram_ctrl_3/s_axi_aclk] [get_bd_pins blk_mem_gen_0/clkb] [get_bd_pins blk_mem_gen_1/clkb] [get_bd_pins blk_mem_gen_2/clkb] [get_bd_pins blk_mem_gen_3/clkb] [get_bd_pins data_bram_controller_0/s00_axi_aclk]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins s00_axi_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_1/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_2/s_axi_aresetn] [get_bd_pins axi_bram_ctrl_3/s_axi_aresetn] [get_bd_pins data_bram_controller_0/s00_axi_aresetn]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins blk_mem_gen_0/web] [get_bd_pins blk_mem_gen_1/web] [get_bd_pins blk_mem_gen_2/web] [get_bd_pins blk_mem_gen_3/web] [get_bd_pins xlconstant_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set rs232_uart [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 rs232_uart ]
  set sys_diff_clock [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sys_diff_clock ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $sys_diff_clock

  # Create ports
  set FMC_clock_cable [ create_bd_port -dir O -type clk FMC_clock_cable ]
  set FMC_data_cable_0 [ create_bd_port -dir O -from 52 -to 0 FMC_data_cable_0 ]
  set FMC_isIM_cable_0 [ create_bd_port -dir O FMC_isIM_cable_0 ]
  set FMC_ready_cable_0 [ create_bd_port -dir I FMC_ready_cable_0 ]
  set FMC_reset_cable [ create_bd_port -dir O -type rst FMC_reset_cable ]
  set FMC_valid_cable_0 [ create_bd_port -dir O FMC_valid_cable_0 ]
  set reset [ create_bd_port -dir I -type rst reset ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $reset

  # Create instance: applyH_0, and set properties
  set block_name applyH
  set block_cell_name applyH_0
  if { [catch {set applyH_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $applyH_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }

  # Create instance: clk_wiz_1, and set properties
  set clk_wiz_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_1 ]
  set_property -dict [ list \
   CONFIG.CLKOUT1_JITTER {129.198} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {sys_diff_clock} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {20.000} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $clk_wiz_1

  # Create instance: data_bram_controller
  create_hier_cell_data_bram_controller [current_bd_instance .] data_bram_controller

  # Create instance: iffts
  create_hier_cell_iffts [current_bd_instance .] iffts

  # Create instance: microblaze_stuff
  create_hier_cell_microblaze_stuff [current_bd_instance .] microblaze_stuff

  # Create instance: post_ifft_fifos
  create_hier_cell_post_ifft_fifos [current_bd_instance .] post_ifft_fifos

  # Create instance: w_tx_0, and set properties
  set block_name w_tx
  set block_cell_name w_tx_0
  if { [catch {set w_tx_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $w_tx_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M00_AXI [get_bd_intf_pins data_bram_controller/S00_AXI] [get_bd_intf_pins microblaze_stuff/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins data_bram_controller/S_AXI] [get_bd_intf_pins microblaze_stuff/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins data_bram_controller/S_AXI1] [get_bd_intf_pins microblaze_stuff/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins data_bram_controller/S_AXI2] [get_bd_intf_pins microblaze_stuff/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M04_AXI [get_bd_intf_pins data_bram_controller/S_AXI3] [get_bd_intf_pins microblaze_stuff/M04_AXI]
  connect_bd_intf_net -intf_net microblaze_stuff_rs232_uart [get_bd_intf_ports rs232_uart] [get_bd_intf_pins microblaze_stuff/rs232_uart]
  connect_bd_intf_net -intf_net sys_diff_clock_1 [get_bd_intf_ports sys_diff_clock] [get_bd_intf_pins clk_wiz_1/CLK_IN1_D]

  # Create port connections
  connect_bd_net -net FMC_ready_cable_0_1 [get_bd_ports FMC_ready_cable_0] [get_bd_pins applyH_0/FMC_ready_cable]
  connect_bd_net -net applyH_0_FMC_data_cable [get_bd_ports FMC_data_cable_0] [get_bd_pins applyH_0/FMC_data_cable]
  connect_bd_net -net applyH_0_FMC_isIM_cable [get_bd_ports FMC_isIM_cable_0] [get_bd_pins applyH_0/FMC_isIM_cable]
  connect_bd_net -net applyH_0_FMC_ready [get_bd_pins applyH_0/FMC_ready] [get_bd_pins w_tx_0/FMC_ready]
  connect_bd_net -net applyH_0_FMC_valid_cable [get_bd_ports FMC_valid_cable_0] [get_bd_pins applyH_0/FMC_valid_cable]
  connect_bd_net -net blk_mem_gen_0_doutb [get_bd_pins data_bram_controller/doutb] [get_bd_pins iffts/s_axis_data_tdata]
  connect_bd_net -net blk_mem_gen_1_doutb [get_bd_pins data_bram_controller/doutb1] [get_bd_pins iffts/s_axis_data_tdata1]
  connect_bd_net -net blk_mem_gen_2_doutb [get_bd_pins data_bram_controller/doutb2] [get_bd_pins iffts/s_axis_data_tdata2]
  connect_bd_net -net blk_mem_gen_3_doutb [get_bd_pins data_bram_controller/doutb3] [get_bd_pins iffts/s_axis_data_tdata3]
  connect_bd_net -net clk_wiz_1_locked [get_bd_pins clk_wiz_1/locked] [get_bd_pins microblaze_stuff/dcm_locked]
  connect_bd_net -net data_bram_controller_0_ifft_s_axis_config_tvalid_0 [get_bd_pins data_bram_controller/ifft_s_axis_config_tvalid_0] [get_bd_pins iffts/s_axis_config_tvalid]
  connect_bd_net -net data_bram_controller_0_ifft_s_axis_data_tlast_0 [get_bd_pins data_bram_controller/ifft_s_axis_data_tlast_0] [get_bd_pins iffts/s_axis_data_tlast]
  connect_bd_net -net data_bram_controller_0_ifft_s_axis_data_tvalid_0 [get_bd_pins data_bram_controller/ifft_s_axis_data_tvalid_0] [get_bd_pins iffts/s_axis_data_tvalid]
  connect_bd_net -net din_0_1 [get_bd_pins iffts/m_axis_data_tdata] [get_bd_pins post_ifft_fifos/din_0]
  connect_bd_net -net din_1_1 [get_bd_pins iffts/m_axis_data_tdata1] [get_bd_pins post_ifft_fifos/din_1]
  connect_bd_net -net din_2_1 [get_bd_pins iffts/m_axis_data_tdata2] [get_bd_pins post_ifft_fifos/din_2]
  connect_bd_net -net din_3_1 [get_bd_pins iffts/m_axis_data_tdata3] [get_bd_pins post_ifft_fifos/din_3]
  connect_bd_net -net iffts_s_axis_config_tready [get_bd_pins data_bram_controller/ifft_s_axis_config_tready_0] [get_bd_pins iffts/s_axis_config_tready]
  connect_bd_net -net iffts_s_axis_data_tready [get_bd_pins data_bram_controller/ifft_s_axis_data_tready_0] [get_bd_pins iffts/s_axis_data_tready]
  connect_bd_net -net m_axis_data_tready_1 [get_bd_pins iffts/m_axis_data_tready] [get_bd_pins post_ifft_fifos/not_full]
  connect_bd_net -net microblaze_0_Clk [get_bd_ports FMC_clock_cable] [get_bd_pins applyH_0/clk] [get_bd_pins clk_wiz_1/clk_out1] [get_bd_pins data_bram_controller/s00_axi_aclk] [get_bd_pins iffts/aclk_0] [get_bd_pins microblaze_stuff/LMB_Clk] [get_bd_pins post_ifft_fifos/clk_0] [get_bd_pins w_tx_0/clk]
  connect_bd_net -net post_ifft_fifos_dout_0 [get_bd_pins post_ifft_fifos/dout_0] [get_bd_pins w_tx_0/w_tx_din_0]
  connect_bd_net -net post_ifft_fifos_dout_1 [get_bd_pins post_ifft_fifos/dout_1] [get_bd_pins w_tx_0/w_tx_din_1]
  connect_bd_net -net post_ifft_fifos_dout_2 [get_bd_pins post_ifft_fifos/dout_2] [get_bd_pins w_tx_0/w_tx_din_2]
  connect_bd_net -net post_ifft_fifos_dout_3 [get_bd_pins post_ifft_fifos/dout_3] [get_bd_pins w_tx_0/w_tx_din_3]
  connect_bd_net -net post_ifft_fifos_empty [get_bd_pins post_ifft_fifos/empty] [get_bd_pins w_tx_0/fifo_empty]
  connect_bd_net -net reset_1 [get_bd_ports FMC_reset_cable] [get_bd_ports reset] [get_bd_pins clk_wiz_1/reset] [get_bd_pins microblaze_stuff/reset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins applyH_0/resetn] [get_bd_pins data_bram_controller/s00_axi_aresetn] [get_bd_pins microblaze_stuff/S00_ARESETN] [get_bd_pins w_tx_0/resetn]
  connect_bd_net -net w_tx_0_FMC_isIM [get_bd_pins applyH_0/FMC_isIM] [get_bd_pins w_tx_0/FMC_isIM]
  connect_bd_net -net w_tx_0_FMC_valid [get_bd_pins applyH_0/FMC_valid] [get_bd_pins w_tx_0/FMC_valid]
  connect_bd_net -net w_tx_0_fifo_rd_en [get_bd_pins post_ifft_fifos/rd_en_0] [get_bd_pins w_tx_0/fifo_rd_en]
  connect_bd_net -net w_tx_0_w_tx_out_0 [get_bd_pins applyH_0/w_tx_out_0] [get_bd_pins w_tx_0/w_tx_out_0]
  connect_bd_net -net w_tx_0_w_tx_out_1 [get_bd_pins applyH_0/w_tx_out_1] [get_bd_pins w_tx_0/w_tx_out_1]
  connect_bd_net -net w_tx_0_w_tx_out_2 [get_bd_pins applyH_0/w_tx_out_2] [get_bd_pins w_tx_0/w_tx_out_2]
  connect_bd_net -net w_tx_0_w_tx_out_3 [get_bd_pins applyH_0/w_tx_out_3] [get_bd_pins w_tx_0/w_tx_out_3]
  connect_bd_net -net wr_en_0_1 [get_bd_pins iffts/m_axis_data_tvalid] [get_bd_pins post_ifft_fifos/wr_en_0]

  # Create address segments
  create_bd_addr_seg -range 0x00002000 -offset 0xC0000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs data_bram_controller/axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00002000 -offset 0xC2000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs data_bram_controller/axi_bram_ctrl_1/S_AXI/Mem0] SEG_axi_bram_ctrl_1_Mem0
  create_bd_addr_seg -range 0x00002000 -offset 0xC4000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs data_bram_controller/axi_bram_ctrl_2/S_AXI/Mem0] SEG_axi_bram_ctrl_2_Mem0
  create_bd_addr_seg -range 0x00002000 -offset 0xC6000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs data_bram_controller/axi_bram_ctrl_3/S_AXI/Mem0] SEG_axi_bram_ctrl_3_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs microblaze_stuff/axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A00000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs data_bram_controller/data_bram_controller_0/S00_AXI/S00_AXI_reg] SEG_data_bram_controller_0_S00_AXI_reg
  create_bd_addr_seg -range 0x00002000 -offset 0x00000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs microblaze_stuff/microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00002000 -offset 0x00000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Instruction] [get_bd_addr_segs microblaze_stuff/microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


