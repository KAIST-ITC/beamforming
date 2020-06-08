
################################################################
# This is a generated script based on design: top_rx
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
# source top_rx_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# w_rx, post_fft_bram_controller, fifo_rx_controller

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
set design_name top_rx

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
xilinx.com:ip:xfft:9.1\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:ip:axi_uartlite:2.0\
xilinx.com:ip:mdm:3.2\
xilinx.com:ip:microblaze:11.0\
xilinx.com:ip:proc_sys_reset:5.0\
xilinx.com:ip:axi_bram_ctrl:4.1\
xilinx.com:ip:blk_mem_gen:8.4\
xilinx.com:ip:fifo_generator:13.2\
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
w_rx\
post_fft_bram_controller\
fifo_rx_controller\
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
  create_bd_pin -dir I -type clk FMC_clock_cable
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
  connect_bd_net -net microblaze_0_Clk [get_bd_pins FMC_clock_cable] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: pre_fft_fifo_wrapper
proc create_hier_cell_pre_fft_fifo_wrapper { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_pre_fft_fifo_wrapper() - Empty argument(s)!"}
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
  create_bd_pin -dir I -type clk FMC_clock_cable
  create_bd_pin -dir I -from 31 -to 0 din
  create_bd_pin -dir O -from 31 -to 0 dout
  create_bd_pin -dir I fft_ready
  create_bd_pin -dir O fifo_ready
  create_bd_pin -dir I -type rst resetn
  create_bd_pin -dir O valid
  create_bd_pin -dir I wr_en

  # Create instance: fifo_generator_0, and set properties
  set fifo_generator_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:fifo_generator:13.2 fifo_generator_0 ]
  set_property -dict [ list \
   CONFIG.Input_Data_Width {32} \
   CONFIG.Output_Data_Width {32} \
   CONFIG.Reset_Pin {false} \
   CONFIG.Reset_Type {Asynchronous_Reset} \
   CONFIG.Use_Dout_Reset {false} \
   CONFIG.Valid_Flag {true} \
 ] $fifo_generator_0

  # Create instance: fifo_rx_controller_0, and set properties
  set block_name fifo_rx_controller
  set block_cell_name fifo_rx_controller_0
  if { [catch {set fifo_rx_controller_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $fifo_rx_controller_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create port connections
  connect_bd_net -net fifo_rx_controller_0_fifo_rd_en [get_bd_pins fifo_generator_0/rd_en] [get_bd_pins fifo_rx_controller_0/fifo_rd_en]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins FMC_clock_cable] [get_bd_pins fifo_generator_0/clk] [get_bd_pins fifo_rx_controller_0/clk]
  connect_bd_net -net pre_fft_fifo_wrapper_dout [get_bd_pins dout] [get_bd_pins fifo_generator_0/dout]
  connect_bd_net -net pre_fft_fifo_wrapper_fifo_ready [get_bd_pins fifo_ready] [get_bd_pins fifo_rx_controller_0/fifo_ready]
  connect_bd_net -net pre_fft_fifo_wrapper_valid [get_bd_pins valid] [get_bd_pins fifo_generator_0/valid]
  connect_bd_net -net rst_FMC_clock_cable_50M_peripheral_aresetn [get_bd_pins resetn] [get_bd_pins fifo_rx_controller_0/resetn]
  connect_bd_net -net w_rx_0_fifo_in [get_bd_pins din] [get_bd_pins fifo_generator_0/din]
  connect_bd_net -net w_rx_0_fifo_wr_en [get_bd_pins wr_en] [get_bd_pins fifo_generator_0/wr_en] [get_bd_pins fifo_rx_controller_0/fifo_wr_en]
  connect_bd_net -net xfft_0_s_axis_data_tready [get_bd_pins fft_ready] [get_bd_pins fifo_rx_controller_0/fft_ready]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: post_fft_bram_ctrl
proc create_hier_cell_post_fft_bram_ctrl { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_post_fft_bram_ctrl() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir I -type clk FMC_clock_cable
  create_bd_pin -dir I -from 31 -to 0 fft_m_axis_data_tdata_0
  create_bd_pin -dir O fft_m_axis_data_tready_0
  create_bd_pin -dir I fft_m_axis_data_tvalid_0
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: axi_bram_ctrl_0, and set properties
  set axi_bram_ctrl_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_bram_ctrl:4.1 axi_bram_ctrl_0 ]
  set_property -dict [ list \
   CONFIG.SINGLE_PORT_BRAM {1} \
 ] $axi_bram_ctrl_0

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

  # Create instance: post_fft_bram_contro_0, and set properties
  set block_name post_fft_bram_controller
  set block_cell_name post_fft_bram_contro_0
  if { [catch {set post_fft_bram_contro_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $post_fft_bram_contro_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net axi_bram_ctrl_0_BRAM_PORTA [get_bd_intf_pins axi_bram_ctrl_0/BRAM_PORTA] [get_bd_intf_pins blk_mem_gen_0/BRAM_PORTB]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_bram_ctrl_0/S_AXI]

  # Create port connections
  connect_bd_net -net fft_m_axis_data_tdata [get_bd_pins fft_m_axis_data_tdata_0] [get_bd_pins post_fft_bram_contro_0/fft_m_axis_data_tdata_0]
  connect_bd_net -net fft_m_axis_data_tvalid [get_bd_pins fft_m_axis_data_tvalid_0] [get_bd_pins post_fft_bram_contro_0/fft_m_axis_data_tvalid_0]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins FMC_clock_cable] [get_bd_pins axi_bram_ctrl_0/s_axi_aclk] [get_bd_pins blk_mem_gen_0/clka] [get_bd_pins post_fft_bram_contro_0/clk]
  connect_bd_net -net post_fft_bram_contro_0_addra_0 [get_bd_pins blk_mem_gen_0/addra] [get_bd_pins post_fft_bram_contro_0/addra_0]
  connect_bd_net -net post_fft_bram_contro_0_dina_0 [get_bd_pins blk_mem_gen_0/dina] [get_bd_pins post_fft_bram_contro_0/dina_0]
  connect_bd_net -net post_fft_bram_contro_0_ena_0 [get_bd_pins blk_mem_gen_0/ena] [get_bd_pins post_fft_bram_contro_0/ena_0]
  connect_bd_net -net post_fft_bram_contro_0_fft_m_axis_data_tready_0 [get_bd_pins fft_m_axis_data_tready_0] [get_bd_pins post_fft_bram_contro_0/fft_m_axis_data_tready_0]
  connect_bd_net -net post_fft_bram_contro_0_wea_0 [get_bd_pins blk_mem_gen_0/wea] [get_bd_pins post_fft_bram_contro_0/wea_0]
  connect_bd_net -net rst_FMC_clock_cable_50M_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins axi_bram_ctrl_0/s_axi_aresetn] [get_bd_pins post_fft_bram_contro_0/resetn]

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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M01_AXI
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 rs232_uart

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 -type rst ARESETN
  create_bd_pin -dir I -type clk FMC_clock_cable
  create_bd_pin -dir I -type rst FMC_reset_cable

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
   CONFIG.NUM_MI {2} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory $hier_obj microblaze_0_local_memory

  # Create instance: rst_FMC_clock_cable_50M, and set properties
  set rst_FMC_clock_cable_50M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_FMC_clock_cable_50M ]
  set_property -dict [ list \
   CONFIG.RESET_BOARD_INTERFACE {reset} \
   CONFIG.USE_BOARD_FLOW {true} \
 ] $rst_FMC_clock_cable_50M

  # Create interface connections
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_pins rs232_uart] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net mdm_1_MBDEBUG_0 [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DP [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M00_AXI [get_bd_intf_pins axi_uartlite_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins M01_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]

  # Create port connections
  connect_bd_net -net FMC_reset_cable_1 [get_bd_pins FMC_reset_cable] [get_bd_pins rst_FMC_clock_cable_50M/ext_reset_in]
  connect_bd_net -net mdm_1_Debug_SYS_Rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_FMC_clock_cable_50M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins FMC_clock_cable] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/FMC_clock_cable] [get_bd_pins rst_FMC_clock_cable_50M/slowest_sync_clk]
  connect_bd_net -net rst_FMC_clock_cable_50M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/SYS_Rst] [get_bd_pins rst_FMC_clock_cable_50M/bus_struct_reset]
  connect_bd_net -net rst_FMC_clock_cable_50M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins rst_FMC_clock_cable_50M/mb_reset]
  connect_bd_net -net rst_FMC_clock_cable_50M_peripheral_aresetn [get_bd_pins ARESETN] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins rst_FMC_clock_cable_50M/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: fft
proc create_hier_cell_fft { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_fft() - Empty argument(s)!"}
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
  create_bd_pin -dir I -type clk FMC_clock_cable
  create_bd_pin -dir O -from 31 -to 0 m_axis_data_tdata
  create_bd_pin -dir I m_axis_data_tready
  create_bd_pin -dir O m_axis_data_tvalid
  create_bd_pin -dir I -from 31 -to 0 s_axis_data_tdata
  create_bd_pin -dir O s_axis_data_tready
  create_bd_pin -dir I s_axis_data_tvalid

  # Create instance: xfft_0, and set properties
  set xfft_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xfft:9.1 xfft_0 ]
  set_property -dict [ list \
   CONFIG.implementation_options {pipelined_streaming_io} \
   CONFIG.number_of_stages_using_block_ram_for_data_and_phase_factors {3} \
   CONFIG.output_ordering {natural_order} \
 ] $xfft_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create instance: xlconstant_1, and set properties
  set xlconstant_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {b0000000100101111} \
   CONFIG.CONST_WIDTH {16} \
 ] $xlconstant_1

  # Create port connections
  connect_bd_net -net FMC_clock_cable_1 [get_bd_pins FMC_clock_cable] [get_bd_pins xfft_0/aclk]
  connect_bd_net -net m_axis_data_tready_1 [get_bd_pins m_axis_data_tready] [get_bd_pins xfft_0/m_axis_data_tready]
  connect_bd_net -net pre_fft_fifo_wrapper_dout [get_bd_pins s_axis_data_tdata] [get_bd_pins xfft_0/s_axis_data_tdata]
  connect_bd_net -net pre_fft_fifo_wrapper_valid [get_bd_pins s_axis_data_tvalid] [get_bd_pins xfft_0/s_axis_data_tvalid]
  connect_bd_net -net xfft_0_m_axis_data_tdata [get_bd_pins m_axis_data_tdata] [get_bd_pins xfft_0/m_axis_data_tdata]
  connect_bd_net -net xfft_0_m_axis_data_tvalid [get_bd_pins m_axis_data_tvalid] [get_bd_pins xfft_0/m_axis_data_tvalid]
  connect_bd_net -net xfft_0_s_axis_data_tready [get_bd_pins s_axis_data_tready] [get_bd_pins xfft_0/s_axis_data_tready]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins xfft_0/s_axis_config_tvalid] [get_bd_pins xlconstant_0/dout]
  connect_bd_net -net xlconstant_1_dout [get_bd_pins xfft_0/s_axis_config_tdata] [get_bd_pins xlconstant_1/dout]

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

  # Create ports
  set FMC_clock_cable [ create_bd_port -dir I -type clk FMC_clock_cable ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {50000000} \
 ] $FMC_clock_cable
  set FMC_data_cable_0 [ create_bd_port -dir I -from 52 -to 0 -type data FMC_data_cable_0 ]
  set FMC_isIM_cable [ create_bd_port -dir I -type data FMC_isIM_cable ]
  set FMC_ready_cable_0 [ create_bd_port -dir O FMC_ready_cable_0 ]
  set FMC_reset_cable [ create_bd_port -dir I -type rst FMC_reset_cable ]
  set_property -dict [ list \
   CONFIG.POLARITY {ACTIVE_HIGH} \
 ] $FMC_reset_cable
  set FMC_valid_cable_0 [ create_bd_port -dir I -type data FMC_valid_cable_0 ]

  # Create instance: fft
  create_hier_cell_fft [current_bd_instance .] fft

  # Create instance: microblaze_stuff
  create_hier_cell_microblaze_stuff [current_bd_instance .] microblaze_stuff

  # Create instance: post_fft_bram_ctrl
  create_hier_cell_post_fft_bram_ctrl [current_bd_instance .] post_fft_bram_ctrl

  # Create instance: pre_fft_fifo_wrapper
  create_hier_cell_pre_fft_fifo_wrapper [current_bd_instance .] pre_fft_fifo_wrapper

  # Create instance: w_rx_0, and set properties
  set block_name w_rx
  set block_cell_name w_rx_0
  if { [catch {set w_rx_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_msg_id "BD_TCL-105" "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $w_rx_0 eq "" } {
     catch {common::send_msg_id "BD_TCL-106" "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create interface connections
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports rs232_uart] [get_bd_intf_pins microblaze_stuff/rs232_uart]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins microblaze_stuff/M01_AXI] [get_bd_intf_pins post_fft_bram_ctrl/S_AXI]

  # Create port connections
  connect_bd_net -net FMC_data_cable_0_1 [get_bd_ports FMC_data_cable_0] [get_bd_pins w_rx_0/FMC_data_cable]
  connect_bd_net -net FMC_isIM_cable_1 [get_bd_ports FMC_isIM_cable] [get_bd_pins w_rx_0/FMC_isIM_cable]
  connect_bd_net -net FMC_reset_cable_1 [get_bd_ports FMC_reset_cable] [get_bd_pins microblaze_stuff/FMC_reset_cable]
  connect_bd_net -net FMC_valid_cable_0_1 [get_bd_ports FMC_valid_cable_0] [get_bd_pins w_rx_0/FMC_valid_cable]
  connect_bd_net -net fft_m_axis_data_tdata [get_bd_pins fft/m_axis_data_tdata] [get_bd_pins post_fft_bram_ctrl/fft_m_axis_data_tdata_0]
  connect_bd_net -net fft_m_axis_data_tvalid [get_bd_pins fft/m_axis_data_tvalid] [get_bd_pins post_fft_bram_ctrl/fft_m_axis_data_tvalid_0]
  connect_bd_net -net microblaze_0_Clk [get_bd_ports FMC_clock_cable] [get_bd_pins fft/FMC_clock_cable] [get_bd_pins microblaze_stuff/FMC_clock_cable] [get_bd_pins post_fft_bram_ctrl/FMC_clock_cable] [get_bd_pins pre_fft_fifo_wrapper/FMC_clock_cable] [get_bd_pins w_rx_0/clk]
  connect_bd_net -net post_fft_bram_contro_0_fft_m_axis_data_tready_0 [get_bd_pins fft/m_axis_data_tready] [get_bd_pins post_fft_bram_ctrl/fft_m_axis_data_tready_0]
  connect_bd_net -net pre_fft_fifo_wrapper_dout [get_bd_pins fft/s_axis_data_tdata] [get_bd_pins pre_fft_fifo_wrapper/dout]
  connect_bd_net -net pre_fft_fifo_wrapper_fifo_ready [get_bd_pins pre_fft_fifo_wrapper/fifo_ready] [get_bd_pins w_rx_0/fifo_ready]
  connect_bd_net -net pre_fft_fifo_wrapper_valid [get_bd_pins fft/s_axis_data_tvalid] [get_bd_pins pre_fft_fifo_wrapper/valid]
  connect_bd_net -net rst_FMC_clock_cable_50M_peripheral_aresetn [get_bd_pins microblaze_stuff/ARESETN] [get_bd_pins post_fft_bram_ctrl/s_axi_aresetn] [get_bd_pins pre_fft_fifo_wrapper/resetn] [get_bd_pins w_rx_0/resetn]
  connect_bd_net -net w_rx_0_FMC_ready_cable [get_bd_ports FMC_ready_cable_0] [get_bd_pins w_rx_0/FMC_ready_cable]
  connect_bd_net -net w_rx_0_fifo_in [get_bd_pins pre_fft_fifo_wrapper/din] [get_bd_pins w_rx_0/fifo_in]
  connect_bd_net -net w_rx_0_fifo_wr_en [get_bd_pins pre_fft_fifo_wrapper/wr_en] [get_bd_pins w_rx_0/fifo_wr_en]
  connect_bd_net -net xfft_0_s_axis_data_tready [get_bd_pins fft/s_axis_data_tready] [get_bd_pins pre_fft_fifo_wrapper/fft_ready]

  # Create address segments
  create_bd_addr_seg -range 0x00002000 -offset 0xC0000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs post_fft_bram_ctrl/axi_bram_ctrl_0/S_AXI/Mem0] SEG_axi_bram_ctrl_0_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x40600000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs microblaze_stuff/axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00002000 -offset 0x00000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Data] [get_bd_addr_segs microblaze_stuff/microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00004000 -offset 0x00000000 [get_bd_addr_spaces microblaze_stuff/microblaze_0/Instruction] [get_bd_addr_segs microblaze_stuff/microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem


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


