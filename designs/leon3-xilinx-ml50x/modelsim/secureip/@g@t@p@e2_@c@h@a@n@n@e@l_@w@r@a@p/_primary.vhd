library verilog;
use verilog.vl_types.all;
entity GTPE2_CHANNEL_WRAP is
    generic(
        ACJTAG_DEBUG_MODE: string  := "0";
        ACJTAG_MODE     : string  := "0";
        ACJTAG_RESET    : string  := "0";
        ADAPT_CFG0      : string  := "00000000000000000000";
        ALIGN_COMMA_DOUBLE: string  := "FALSE";
        ALIGN_COMMA_ENABLE: string  := "0001111111";
        ALIGN_COMMA_WORD: integer := 1;
        ALIGN_MCOMMA_DET: string  := "TRUE";
        ALIGN_MCOMMA_VALUE: string  := "1010000011";
        ALIGN_PCOMMA_DET: string  := "TRUE";
        ALIGN_PCOMMA_VALUE: string  := "0101111100";
        CBCC_DATA_SOURCE_SEL: string  := "DECODED";
        CFOK_CFG        : string  := "0000000000000000000000000000000000000000000";
        CFOK_CFG2       : string  := "0000000";
        CFOK_CFG3       : string  := "0000000";
        CFOK_CFG4       : string  := "0";
        CFOK_CFG5       : string  := "00";
        CFOK_CFG6       : string  := "0000";
        CHAN_BOND_KEEP_ALIGN: string  := "FALSE";
        CHAN_BOND_MAX_SKEW: integer := 7;
        CHAN_BOND_SEQ_1_1: string  := "0101111100";
        CHAN_BOND_SEQ_1_2: string  := "0000000000";
        CHAN_BOND_SEQ_1_3: string  := "0000000000";
        CHAN_BOND_SEQ_1_4: string  := "0000000000";
        CHAN_BOND_SEQ_1_ENABLE: string  := "1111";
        CHAN_BOND_SEQ_2_1: string  := "0100000000";
        CHAN_BOND_SEQ_2_2: string  := "0100000000";
        CHAN_BOND_SEQ_2_3: string  := "0100000000";
        CHAN_BOND_SEQ_2_4: string  := "0100000000";
        CHAN_BOND_SEQ_2_ENABLE: string  := "1111";
        CHAN_BOND_SEQ_2_USE: string  := "FALSE";
        CHAN_BOND_SEQ_LEN: integer := 1;
        CLK_COMMON_SWING: string  := "0";
        CLK_CORRECT_USE : string  := "TRUE";
        CLK_COR_KEEP_IDLE: string  := "FALSE";
        CLK_COR_MAX_LAT : integer := 20;
        CLK_COR_MIN_LAT : integer := 18;
        CLK_COR_PRECEDENCE: string  := "TRUE";
        CLK_COR_REPEAT_WAIT: integer := 0;
        CLK_COR_SEQ_1_1 : string  := "0100011100";
        CLK_COR_SEQ_1_2 : string  := "0000000000";
        CLK_COR_SEQ_1_3 : string  := "0000000000";
        CLK_COR_SEQ_1_4 : string  := "0000000000";
        CLK_COR_SEQ_1_ENABLE: string  := "1111";
        CLK_COR_SEQ_2_1 : string  := "0100000000";
        CLK_COR_SEQ_2_2 : string  := "0100000000";
        CLK_COR_SEQ_2_3 : string  := "0100000000";
        CLK_COR_SEQ_2_4 : string  := "0100000000";
        CLK_COR_SEQ_2_ENABLE: string  := "1111";
        CLK_COR_SEQ_2_USE: string  := "FALSE";
        CLK_COR_SEQ_LEN : integer := 1;
        DEC_MCOMMA_DETECT: string  := "TRUE";
        DEC_PCOMMA_DETECT: string  := "TRUE";
        DEC_VALID_COMMA_ONLY: string  := "TRUE";
        DMONITOR_CFG    : string  := "000A00";
        ES_CLK_PHASE_SEL: string  := "0";
        ES_CONTROL      : string  := "000000";
        ES_ERRDET_EN    : string  := "FALSE";
        ES_EYE_SCAN_EN  : string  := "FALSE";
        ES_HORZ_OFFSET  : string  := "010";
        ES_PMA_CFG      : string  := "0000000000";
        ES_PRESCALE     : string  := "00000";
        ES_QUALIFIER    : string  := "00000000000000000000";
        ES_QUAL_MASK    : string  := "00000000000000000000";
        ES_SDATA_MASK   : string  := "00000000000000000000";
        ES_VERT_OFFSET  : string  := "000000000";
        FTS_DESKEW_SEQ_ENABLE: string  := "1111";
        FTS_LANE_DESKEW_CFG: string  := "1111";
        FTS_LANE_DESKEW_EN: string  := "FALSE";
        GEARBOX_MODE    : string  := "000";
        LOOPBACK_CFG    : string  := "0";
        OUTREFCLK_SEL_INV: string  := "11";
        PCS_PCIE_EN     : string  := "FALSE";
        PCS_RSVD_ATTR   : string  := "000000000000";
        PD_TRANS_TIME_FROM_P2: string  := "03C";
        PD_TRANS_TIME_NONE_P2: string  := "19";
        PD_TRANS_TIME_TO_P2: string  := "64";
        PMA_LOOPBACK_CFG: string  := "0";
        PMA_RSV         : string  := "00000333";
        PMA_RSV2        : string  := "00002050";
        PMA_RSV3        : string  := "00";
        PMA_RSV4        : string  := "0000";
        PMA_RSV5        : string  := "0";
        PMA_RSV6        : string  := "0";
        PMA_RSV7        : string  := "0";
        RXBUFRESET_TIME : string  := "00001";
        RXBUF_ADDR_MODE : string  := "FULL";
        RXBUF_EIDLE_HI_CNT: string  := "1000";
        RXBUF_EIDLE_LO_CNT: string  := "0000";
        RXBUF_EN        : string  := "TRUE";
        RXBUF_RESET_ON_CB_CHANGE: string  := "TRUE";
        RXBUF_RESET_ON_COMMAALIGN: string  := "FALSE";
        RXBUF_RESET_ON_EIDLE: string  := "FALSE";
        RXBUF_RESET_ON_RATE_CHANGE: string  := "TRUE";
        RXBUF_THRESH_OVFLW: integer := 61;
        RXBUF_THRESH_OVRD: string  := "FALSE";
        RXBUF_THRESH_UNDFLW: integer := 4;
        RXCDRFREQRESET_TIME: string  := "00001";
        RXCDRPHRESET_TIME: string  := "00001";
        RXCDR_CFG       : string  := "0001107FE406001080000";
        RXCDR_FR_RESET_ON_EIDLE: string  := "0";
        RXCDR_HOLD_DURING_EIDLE: string  := "0";
        RXCDR_LOCK_CFG  : string  := "001001";
        RXCDR_PH_RESET_ON_EIDLE: string  := "0";
        RXDLY_CFG       : string  := "0010";
        RXDLY_LCFG      : string  := "020";
        RXDLY_TAP_CFG   : string  := "0000";
        RXGEARBOX_EN    : string  := "FALSE";
        RXISCANRESET_TIME: string  := "00001";
        RXLPMRESET_TIME : string  := "0001111";
        RXLPM_BIAS_STARTUP_DISABLE: string  := "0";
        RXLPM_CFG       : string  := "0000";
        RXLPM_CFG1      : string  := "0";
        RXLPM_CM_CFG    : string  := "0";
        RXLPM_GC_CFG    : string  := "000000000";
        RXLPM_GC_CFG2   : string  := "000";
        RXLPM_HF_CFG    : string  := "00001111110000";
        RXLPM_HF_CFG2   : string  := "00000";
        RXLPM_HF_CFG3   : string  := "0000";
        RXLPM_HOLD_DURING_EIDLE: string  := "0";
        RXLPM_INCM_CFG  : string  := "0";
        RXLPM_IPCM_CFG  : string  := "0";
        RXLPM_LF_CFG    : string  := "000000001111110000";
        RXLPM_LF_CFG2   : string  := "00000";
        RXLPM_OSINT_CFG : string  := "000";
        RXOOB_CFG       : string  := "0000110";
        RXOOB_CLK_CFG   : string  := "PMA";
        RXOSCALRESET_TIME: string  := "00011";
        RXOSCALRESET_TIMEOUT: string  := "00000";
        RXOUT_DIV       : integer := 2;
        RXPCSRESET_TIME : string  := "00001";
        RXPHDLY_CFG     : string  := "084000";
        RXPH_CFG        : string  := "000000";
        RXPH_MONITOR_SEL: string  := "00000";
        RXPI_CFG0       : string  := "000";
        RXPI_CFG1       : string  := "0";
        RXPI_CFG2       : string  := "0";
        RXPMARESET_TIME : string  := "00011";
        RXPRBS_ERR_LOOPBACK: string  := "0";
        RXSLIDE_AUTO_WAIT: integer := 7;
        RXSLIDE_MODE    : string  := "OFF";
        RXSYNC_MULTILANE: string  := "0";
        RXSYNC_OVRD     : string  := "0";
        RXSYNC_SKIP_DA  : string  := "0";
        RX_BIAS_CFG     : string  := "0000111100110011";
        RX_BUFFER_CFG   : string  := "000000";
        RX_CLK25_DIV    : integer := 7;
        RX_CLKMUX_EN    : string  := "1";
        RX_CM_SEL       : string  := "11";
        RX_CM_TRIM      : string  := "0100";
        RX_DATA_WIDTH   : integer := 20;
        RX_DDI_SEL      : string  := "000000";
        RX_DEBUG_CFG    : string  := "00000000000000";
        RX_DEFER_RESET_BUF_EN: string  := "TRUE";
        RX_DISPERR_SEQ_MATCH: string  := "TRUE";
        RX_OS_CFG       : string  := "0001111110000";
        RX_SIG_VALID_DLY: integer := 10;
        RX_XCLK_SEL     : string  := "RXREC";
        SAS_MAX_COM     : integer := 64;
        SAS_MIN_COM     : integer := 36;
        SATA_BURST_SEQ_LEN: string  := "1111";
        SATA_BURST_VAL  : string  := "100";
        SATA_EIDLE_VAL  : string  := "100";
        SATA_MAX_BURST  : integer := 8;
        SATA_MAX_INIT   : integer := 21;
        SATA_MAX_WAKE   : integer := 7;
        SATA_MIN_BURST  : integer := 4;
        SATA_MIN_INIT   : integer := 12;
        SATA_MIN_WAKE   : integer := 4;
        SATA_PLL_CFG    : string  := "VCO_3000MHZ";
        SHOW_REALIGN_COMMA: string  := "TRUE";
        SIM_RECEIVER_DETECT_PASS: string  := "TRUE";
        SIM_RESET_SPEEDUP: string  := "TRUE";
        SIM_TX_EIDLE_DRIVE_LEVEL: string  := "X";
        SIM_VERSION     : string  := "1.0";
        TERM_RCAL_CFG   : string  := "100001000010000";
        TERM_RCAL_OVRD  : string  := "000";
        TRANS_TIME_RATE : string  := "0E";
        TST_RSV         : string  := "00000000";
        TXBUF_EN        : string  := "TRUE";
        TXBUF_RESET_ON_RATE_CHANGE: string  := "FALSE";
        TXDLY_CFG       : string  := "0010";
        TXDLY_LCFG      : string  := "020";
        TXDLY_TAP_CFG   : string  := "0000";
        TXGEARBOX_EN    : string  := "FALSE";
        TXOOB_CFG       : string  := "0";
        TXOUT_DIV       : integer := 2;
        TXPCSRESET_TIME : string  := "00001";
        TXPHDLY_CFG     : string  := "084000";
        TXPH_CFG        : string  := "0400";
        TXPH_MONITOR_SEL: string  := "00000";
        TXPI_CFG0       : string  := "00";
        TXPI_CFG1       : string  := "00";
        TXPI_CFG2       : string  := "00";
        TXPI_CFG3       : string  := "0";
        TXPI_CFG4       : string  := "0";
        TXPI_CFG5       : string  := "000";
        TXPI_GREY_SEL   : string  := "0";
        TXPI_INVSTROBE_SEL: string  := "0";
        TXPI_PPMCLK_SEL : string  := "TXUSRCLK2";
        TXPI_PPM_CFG    : string  := "00000000";
        TXPI_SYNFREQ_PPM: string  := "000";
        TXPMARESET_TIME : string  := "00001";
        TXSYNC_MULTILANE: string  := "0";
        TXSYNC_OVRD     : string  := "0";
        TXSYNC_SKIP_DA  : string  := "0";
        TX_CLK25_DIV    : integer := 7;
        TX_CLKMUX_EN    : string  := "1";
        TX_DATA_WIDTH   : integer := 20;
        TX_DEEMPH0      : string  := "000000";
        TX_DEEMPH1      : string  := "000000";
        TX_DRIVE_MODE   : string  := "DIRECT";
        TX_EIDLE_ASSERT_DELAY: string  := "110";
        TX_EIDLE_DEASSERT_DELAY: string  := "100";
        TX_LOOPBACK_DRIVE_HIZ: string  := "FALSE";
        TX_MAINCURSOR_SEL: string  := "0";
        TX_MARGIN_FULL_0: string  := "1001110";
        TX_MARGIN_FULL_1: string  := "1001001";
        TX_MARGIN_FULL_2: string  := "1000101";
        TX_MARGIN_FULL_3: string  := "1000010";
        TX_MARGIN_FULL_4: string  := "1000000";
        TX_MARGIN_LOW_0 : string  := "1000110";
        TX_MARGIN_LOW_1 : string  := "1000100";
        TX_MARGIN_LOW_2 : string  := "1000010";
        TX_MARGIN_LOW_3 : string  := "1000000";
        TX_MARGIN_LOW_4 : string  := "1000000";
        TX_PREDRIVER_MODE: string  := "0";
        TX_RXDETECT_CFG : string  := "1832";
        TX_RXDETECT_REF : string  := "100";
        TX_XCLK_SEL     : string  := "TXUSR";
        UCODEER_CLR     : string  := "0";
        USE_PCS_CLK_PHASE_SEL: string  := "0"
    );
    port(
        DMONITOROUT     : out    vl_logic_vector(14 downto 0);
        DRPDO           : out    vl_logic_vector(15 downto 0);
        DRPRDY          : out    vl_logic;
        EYESCANDATAERROR: out    vl_logic;
        GTPTXN          : out    vl_logic;
        GTPTXP          : out    vl_logic;
        PCSRSVDOUT      : out    vl_logic_vector(15 downto 0);
        PHYSTATUS       : out    vl_logic;
        PMARSVDOUT0     : out    vl_logic;
        PMARSVDOUT1     : out    vl_logic;
        RXBUFSTATUS     : out    vl_logic_vector(2 downto 0);
        RXBYTEISALIGNED : out    vl_logic;
        RXBYTEREALIGN   : out    vl_logic;
        RXCDRLOCK       : out    vl_logic;
        RXCHANBONDSEQ   : out    vl_logic;
        RXCHANISALIGNED : out    vl_logic;
        RXCHANREALIGN   : out    vl_logic;
        RXCHARISCOMMA   : out    vl_logic_vector(3 downto 0);
        RXCHARISK       : out    vl_logic_vector(3 downto 0);
        RXCHBONDO       : out    vl_logic_vector(3 downto 0);
        RXCLKCORCNT     : out    vl_logic_vector(1 downto 0);
        RXCOMINITDET    : out    vl_logic;
        RXCOMMADET      : out    vl_logic;
        RXCOMSASDET     : out    vl_logic;
        RXCOMWAKEDET    : out    vl_logic;
        RXDATA          : out    vl_logic_vector(31 downto 0);
        RXDATAVALID     : out    vl_logic_vector(1 downto 0);
        RXDISPERR       : out    vl_logic_vector(3 downto 0);
        RXDLYSRESETDONE : out    vl_logic;
        RXELECIDLE      : out    vl_logic;
        RXHEADER        : out    vl_logic_vector(2 downto 0);
        RXHEADERVALID   : out    vl_logic;
        RXNOTINTABLE    : out    vl_logic_vector(3 downto 0);
        RXOSINTDONE     : out    vl_logic;
        RXOSINTSTARTED  : out    vl_logic;
        RXOSINTSTROBEDONE: out    vl_logic;
        RXOSINTSTROBESTARTED: out    vl_logic;
        RXOUTCLK        : out    vl_logic;
        RXOUTCLKFABRIC  : out    vl_logic;
        RXOUTCLKPCS     : out    vl_logic;
        RXPHALIGNDONE   : out    vl_logic;
        RXPHMONITOR     : out    vl_logic_vector(4 downto 0);
        RXPHSLIPMONITOR : out    vl_logic_vector(4 downto 0);
        RXPMARESETDONE  : out    vl_logic;
        RXPRBSERR       : out    vl_logic;
        RXRATEDONE      : out    vl_logic;
        RXRESETDONE     : out    vl_logic;
        RXSTARTOFSEQ    : out    vl_logic_vector(1 downto 0);
        RXSTATUS        : out    vl_logic_vector(2 downto 0);
        RXSYNCDONE      : out    vl_logic;
        RXSYNCOUT       : out    vl_logic;
        RXVALID         : out    vl_logic;
        TXBUFSTATUS     : out    vl_logic_vector(1 downto 0);
        TXCOMFINISH     : out    vl_logic;
        TXDLYSRESETDONE : out    vl_logic;
        TXGEARBOXREADY  : out    vl_logic;
        TXOUTCLK        : out    vl_logic;
        TXOUTCLKFABRIC  : out    vl_logic;
        TXOUTCLKPCS     : out    vl_logic;
        TXPHALIGNDONE   : out    vl_logic;
        TXPHINITDONE    : out    vl_logic;
        TXPMARESETDONE  : out    vl_logic;
        TXRATEDONE      : out    vl_logic;
        TXRESETDONE     : out    vl_logic;
        TXSYNCDONE      : out    vl_logic;
        TXSYNCOUT       : out    vl_logic;
        CFGRESET        : in     vl_logic;
        CLKRSVD0        : in     vl_logic;
        CLKRSVD1        : in     vl_logic;
        DMONFIFORESET   : in     vl_logic;
        DMONITORCLK     : in     vl_logic;
        DRPADDR         : in     vl_logic_vector(8 downto 0);
        DRPCLK          : in     vl_logic;
        DRPDI           : in     vl_logic_vector(15 downto 0);
        DRPEN           : in     vl_logic;
        DRPWE           : in     vl_logic;
        EYESCANMODE     : in     vl_logic;
        EYESCANRESET    : in     vl_logic;
        EYESCANTRIGGER  : in     vl_logic;
        GTPRXN          : in     vl_logic;
        GTPRXP          : in     vl_logic;
        GTRESETSEL      : in     vl_logic;
        GTRSVD          : in     vl_logic_vector(15 downto 0);
        GTRXRESET       : in     vl_logic;
        GTTXRESET       : in     vl_logic;
        LOOPBACK        : in     vl_logic_vector(2 downto 0);
        PCSRSVDIN       : in     vl_logic_vector(15 downto 0);
        PLL0CLK         : in     vl_logic;
        PLL0REFCLK      : in     vl_logic;
        PLL1CLK         : in     vl_logic;
        PLL1REFCLK      : in     vl_logic;
        PMARSVDIN0      : in     vl_logic;
        PMARSVDIN1      : in     vl_logic;
        PMARSVDIN2      : in     vl_logic;
        PMARSVDIN3      : in     vl_logic;
        PMARSVDIN4      : in     vl_logic;
        RESETOVRD       : in     vl_logic;
        RX8B10BEN       : in     vl_logic;
        RXADAPTSELTEST  : in     vl_logic_vector(13 downto 0);
        RXBUFRESET      : in     vl_logic;
        RXCDRFREQRESET  : in     vl_logic;
        RXCDRHOLD       : in     vl_logic;
        RXCDROVRDEN     : in     vl_logic;
        RXCDRRESET      : in     vl_logic;
        RXCDRRESETRSV   : in     vl_logic;
        RXCHBONDEN      : in     vl_logic;
        RXCHBONDI       : in     vl_logic_vector(3 downto 0);
        RXCHBONDLEVEL   : in     vl_logic_vector(2 downto 0);
        RXCHBONDMASTER  : in     vl_logic;
        RXCHBONDSLAVE   : in     vl_logic;
        RXCOMMADETEN    : in     vl_logic;
        RXDDIEN         : in     vl_logic;
        RXDFEXYDEN      : in     vl_logic;
        RXDLYBYPASS     : in     vl_logic;
        RXDLYEN         : in     vl_logic;
        RXDLYOVRDEN     : in     vl_logic;
        RXDLYSRESET     : in     vl_logic;
        RXELECIDLEMODE  : in     vl_logic_vector(1 downto 0);
        RXGEARBOXSLIP   : in     vl_logic;
        RXLPMHFHOLD     : in     vl_logic;
        RXLPMHFOVRDEN   : in     vl_logic;
        RXLPMLFHOLD     : in     vl_logic;
        RXLPMLFOVRDEN   : in     vl_logic;
        RXLPMOSINTNTRLEN: in     vl_logic;
        RXLPMRESET      : in     vl_logic;
        RXMCOMMAALIGNEN : in     vl_logic;
        RXOOBRESET      : in     vl_logic;
        RXOSCALRESET    : in     vl_logic;
        RXOSHOLD        : in     vl_logic;
        RXOSINTCFG      : in     vl_logic_vector(3 downto 0);
        RXOSINTEN       : in     vl_logic;
        RXOSINTHOLD     : in     vl_logic;
        RXOSINTID0      : in     vl_logic_vector(3 downto 0);
        RXOSINTNTRLEN   : in     vl_logic;
        RXOSINTOVRDEN   : in     vl_logic;
        RXOSINTPD       : in     vl_logic;
        RXOSINTSTROBE   : in     vl_logic;
        RXOSINTTESTOVRDEN: in     vl_logic;
        RXOSOVRDEN      : in     vl_logic;
        RXOUTCLKSEL     : in     vl_logic_vector(2 downto 0);
        RXPCOMMAALIGNEN : in     vl_logic;
        RXPCSRESET      : in     vl_logic;
        RXPD            : in     vl_logic_vector(1 downto 0);
        RXPHALIGN       : in     vl_logic;
        RXPHALIGNEN     : in     vl_logic;
        RXPHDLYPD       : in     vl_logic;
        RXPHDLYRESET    : in     vl_logic;
        RXPHOVRDEN      : in     vl_logic;
        RXPMARESET      : in     vl_logic;
        RXPOLARITY      : in     vl_logic;
        RXPRBSCNTRESET  : in     vl_logic;
        RXPRBSSEL       : in     vl_logic_vector(2 downto 0);
        RXRATE          : in     vl_logic_vector(2 downto 0);
        RXRATEMODE      : in     vl_logic;
        RXSLIDE         : in     vl_logic;
        RXSYNCALLIN     : in     vl_logic;
        RXSYNCIN        : in     vl_logic;
        RXSYNCMODE      : in     vl_logic;
        RXSYSCLKSEL     : in     vl_logic_vector(1 downto 0);
        RXUSERRDY       : in     vl_logic;
        RXUSRCLK        : in     vl_logic;
        RXUSRCLK2       : in     vl_logic;
        SETERRSTATUS    : in     vl_logic;
        SIGVALIDCLK     : in     vl_logic;
        TSTIN           : in     vl_logic_vector(19 downto 0);
        TX8B10BBYPASS   : in     vl_logic_vector(3 downto 0);
        TX8B10BEN       : in     vl_logic;
        TXBUFDIFFCTRL   : in     vl_logic_vector(2 downto 0);
        TXCHARDISPMODE  : in     vl_logic_vector(3 downto 0);
        TXCHARDISPVAL   : in     vl_logic_vector(3 downto 0);
        TXCHARISK       : in     vl_logic_vector(3 downto 0);
        TXCOMINIT       : in     vl_logic;
        TXCOMSAS        : in     vl_logic;
        TXCOMWAKE       : in     vl_logic;
        TXDATA          : in     vl_logic_vector(31 downto 0);
        TXDEEMPH        : in     vl_logic;
        TXDETECTRX      : in     vl_logic;
        TXDIFFCTRL      : in     vl_logic_vector(3 downto 0);
        TXDIFFPD        : in     vl_logic;
        TXDLYBYPASS     : in     vl_logic;
        TXDLYEN         : in     vl_logic;
        TXDLYHOLD       : in     vl_logic;
        TXDLYOVRDEN     : in     vl_logic;
        TXDLYSRESET     : in     vl_logic;
        TXDLYUPDOWN     : in     vl_logic;
        TXELECIDLE      : in     vl_logic;
        TXHEADER        : in     vl_logic_vector(2 downto 0);
        TXINHIBIT       : in     vl_logic;
        TXMAINCURSOR    : in     vl_logic_vector(6 downto 0);
        TXMARGIN        : in     vl_logic_vector(2 downto 0);
        TXOUTCLKSEL     : in     vl_logic_vector(2 downto 0);
        TXPCSRESET      : in     vl_logic;
        TXPD            : in     vl_logic_vector(1 downto 0);
        TXPDELECIDLEMODE: in     vl_logic;
        TXPHALIGN       : in     vl_logic;
        TXPHALIGNEN     : in     vl_logic;
        TXPHDLYPD       : in     vl_logic;
        TXPHDLYRESET    : in     vl_logic;
        TXPHDLYTSTCLK   : in     vl_logic;
        TXPHINIT        : in     vl_logic;
        TXPHOVRDEN      : in     vl_logic;
        TXPIPPMEN       : in     vl_logic;
        TXPIPPMOVRDEN   : in     vl_logic;
        TXPIPPMPD       : in     vl_logic;
        TXPIPPMSEL      : in     vl_logic;
        TXPIPPMSTEPSIZE : in     vl_logic_vector(4 downto 0);
        TXPISOPD        : in     vl_logic;
        TXPMARESET      : in     vl_logic;
        TXPOLARITY      : in     vl_logic;
        TXPOSTCURSOR    : in     vl_logic_vector(4 downto 0);
        TXPOSTCURSORINV : in     vl_logic;
        TXPRBSFORCEERR  : in     vl_logic;
        TXPRBSSEL       : in     vl_logic_vector(2 downto 0);
        TXPRECURSOR     : in     vl_logic_vector(4 downto 0);
        TXPRECURSORINV  : in     vl_logic;
        TXRATE          : in     vl_logic_vector(2 downto 0);
        TXRATEMODE      : in     vl_logic;
        TXSEQUENCE      : in     vl_logic_vector(6 downto 0);
        TXSTARTSEQ      : in     vl_logic;
        TXSWING         : in     vl_logic;
        TXSYNCALLIN     : in     vl_logic;
        TXSYNCIN        : in     vl_logic;
        TXSYNCMODE      : in     vl_logic;
        TXSYSCLKSEL     : in     vl_logic_vector(1 downto 0);
        TXUSERRDY       : in     vl_logic;
        TXUSRCLK        : in     vl_logic;
        TXUSRCLK2       : in     vl_logic;
        GSR             : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ACJTAG_DEBUG_MODE : constant is 1;
    attribute mti_svvh_generic_type of ACJTAG_MODE : constant is 1;
    attribute mti_svvh_generic_type of ACJTAG_RESET : constant is 1;
    attribute mti_svvh_generic_type of ADAPT_CFG0 : constant is 1;
    attribute mti_svvh_generic_type of ALIGN_COMMA_DOUBLE : constant is 1;
    attribute mti_svvh_generic_type of ALIGN_COMMA_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of ALIGN_COMMA_WORD : constant is 2;
    attribute mti_svvh_generic_type of ALIGN_MCOMMA_DET : constant is 1;
    attribute mti_svvh_generic_type of ALIGN_MCOMMA_VALUE : constant is 1;
    attribute mti_svvh_generic_type of ALIGN_PCOMMA_DET : constant is 1;
    attribute mti_svvh_generic_type of ALIGN_PCOMMA_VALUE : constant is 1;
    attribute mti_svvh_generic_type of CBCC_DATA_SOURCE_SEL : constant is 1;
    attribute mti_svvh_generic_type of CFOK_CFG : constant is 1;
    attribute mti_svvh_generic_type of CFOK_CFG2 : constant is 1;
    attribute mti_svvh_generic_type of CFOK_CFG3 : constant is 1;
    attribute mti_svvh_generic_type of CFOK_CFG4 : constant is 1;
    attribute mti_svvh_generic_type of CFOK_CFG5 : constant is 1;
    attribute mti_svvh_generic_type of CFOK_CFG6 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_KEEP_ALIGN : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_MAX_SKEW : constant is 2;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_1_1 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_1_2 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_1_3 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_1_4 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_1_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_2_1 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_2_2 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_2_3 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_2_4 : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_2_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_2_USE : constant is 1;
    attribute mti_svvh_generic_type of CHAN_BOND_SEQ_LEN : constant is 2;
    attribute mti_svvh_generic_type of CLK_COMMON_SWING : constant is 1;
    attribute mti_svvh_generic_type of CLK_CORRECT_USE : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_KEEP_IDLE : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_MAX_LAT : constant is 2;
    attribute mti_svvh_generic_type of CLK_COR_MIN_LAT : constant is 2;
    attribute mti_svvh_generic_type of CLK_COR_PRECEDENCE : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_REPEAT_WAIT : constant is 2;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_1_1 : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_1_2 : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_1_3 : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_1_4 : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_1_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_2_1 : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_2_2 : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_2_3 : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_2_4 : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_2_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_2_USE : constant is 1;
    attribute mti_svvh_generic_type of CLK_COR_SEQ_LEN : constant is 2;
    attribute mti_svvh_generic_type of DEC_MCOMMA_DETECT : constant is 1;
    attribute mti_svvh_generic_type of DEC_PCOMMA_DETECT : constant is 1;
    attribute mti_svvh_generic_type of DEC_VALID_COMMA_ONLY : constant is 1;
    attribute mti_svvh_generic_type of DMONITOR_CFG : constant is 1;
    attribute mti_svvh_generic_type of ES_CLK_PHASE_SEL : constant is 1;
    attribute mti_svvh_generic_type of ES_CONTROL : constant is 1;
    attribute mti_svvh_generic_type of ES_ERRDET_EN : constant is 1;
    attribute mti_svvh_generic_type of ES_EYE_SCAN_EN : constant is 1;
    attribute mti_svvh_generic_type of ES_HORZ_OFFSET : constant is 1;
    attribute mti_svvh_generic_type of ES_PMA_CFG : constant is 1;
    attribute mti_svvh_generic_type of ES_PRESCALE : constant is 1;
    attribute mti_svvh_generic_type of ES_QUALIFIER : constant is 1;
    attribute mti_svvh_generic_type of ES_QUAL_MASK : constant is 1;
    attribute mti_svvh_generic_type of ES_SDATA_MASK : constant is 1;
    attribute mti_svvh_generic_type of ES_VERT_OFFSET : constant is 1;
    attribute mti_svvh_generic_type of FTS_DESKEW_SEQ_ENABLE : constant is 1;
    attribute mti_svvh_generic_type of FTS_LANE_DESKEW_CFG : constant is 1;
    attribute mti_svvh_generic_type of FTS_LANE_DESKEW_EN : constant is 1;
    attribute mti_svvh_generic_type of GEARBOX_MODE : constant is 1;
    attribute mti_svvh_generic_type of LOOPBACK_CFG : constant is 1;
    attribute mti_svvh_generic_type of OUTREFCLK_SEL_INV : constant is 1;
    attribute mti_svvh_generic_type of PCS_PCIE_EN : constant is 1;
    attribute mti_svvh_generic_type of PCS_RSVD_ATTR : constant is 1;
    attribute mti_svvh_generic_type of PD_TRANS_TIME_FROM_P2 : constant is 1;
    attribute mti_svvh_generic_type of PD_TRANS_TIME_NONE_P2 : constant is 1;
    attribute mti_svvh_generic_type of PD_TRANS_TIME_TO_P2 : constant is 1;
    attribute mti_svvh_generic_type of PMA_LOOPBACK_CFG : constant is 1;
    attribute mti_svvh_generic_type of PMA_RSV : constant is 1;
    attribute mti_svvh_generic_type of PMA_RSV2 : constant is 1;
    attribute mti_svvh_generic_type of PMA_RSV3 : constant is 1;
    attribute mti_svvh_generic_type of PMA_RSV4 : constant is 1;
    attribute mti_svvh_generic_type of PMA_RSV5 : constant is 1;
    attribute mti_svvh_generic_type of PMA_RSV6 : constant is 1;
    attribute mti_svvh_generic_type of PMA_RSV7 : constant is 1;
    attribute mti_svvh_generic_type of RXBUFRESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_ADDR_MODE : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_EIDLE_HI_CNT : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_EIDLE_LO_CNT : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_EN : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_RESET_ON_CB_CHANGE : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_RESET_ON_COMMAALIGN : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_RESET_ON_EIDLE : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_RESET_ON_RATE_CHANGE : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_THRESH_OVFLW : constant is 2;
    attribute mti_svvh_generic_type of RXBUF_THRESH_OVRD : constant is 1;
    attribute mti_svvh_generic_type of RXBUF_THRESH_UNDFLW : constant is 2;
    attribute mti_svvh_generic_type of RXCDRFREQRESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of RXCDRPHRESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of RXCDR_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXCDR_FR_RESET_ON_EIDLE : constant is 1;
    attribute mti_svvh_generic_type of RXCDR_HOLD_DURING_EIDLE : constant is 1;
    attribute mti_svvh_generic_type of RXCDR_LOCK_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXCDR_PH_RESET_ON_EIDLE : constant is 1;
    attribute mti_svvh_generic_type of RXDLY_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXDLY_LCFG : constant is 1;
    attribute mti_svvh_generic_type of RXDLY_TAP_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXGEARBOX_EN : constant is 1;
    attribute mti_svvh_generic_type of RXISCANRESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of RXLPMRESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_BIAS_STARTUP_DISABLE : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_CFG1 : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_CM_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_GC_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_GC_CFG2 : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_HF_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_HF_CFG2 : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_HF_CFG3 : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_HOLD_DURING_EIDLE : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_INCM_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_IPCM_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_LF_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_LF_CFG2 : constant is 1;
    attribute mti_svvh_generic_type of RXLPM_OSINT_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXOOB_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXOOB_CLK_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXOSCALRESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of RXOSCALRESET_TIMEOUT : constant is 1;
    attribute mti_svvh_generic_type of RXOUT_DIV : constant is 2;
    attribute mti_svvh_generic_type of RXPCSRESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of RXPHDLY_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXPH_CFG : constant is 1;
    attribute mti_svvh_generic_type of RXPH_MONITOR_SEL : constant is 1;
    attribute mti_svvh_generic_type of RXPI_CFG0 : constant is 1;
    attribute mti_svvh_generic_type of RXPI_CFG1 : constant is 1;
    attribute mti_svvh_generic_type of RXPI_CFG2 : constant is 1;
    attribute mti_svvh_generic_type of RXPMARESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of RXPRBS_ERR_LOOPBACK : constant is 1;
    attribute mti_svvh_generic_type of RXSLIDE_AUTO_WAIT : constant is 2;
    attribute mti_svvh_generic_type of RXSLIDE_MODE : constant is 1;
    attribute mti_svvh_generic_type of RXSYNC_MULTILANE : constant is 1;
    attribute mti_svvh_generic_type of RXSYNC_OVRD : constant is 1;
    attribute mti_svvh_generic_type of RXSYNC_SKIP_DA : constant is 1;
    attribute mti_svvh_generic_type of RX_BIAS_CFG : constant is 1;
    attribute mti_svvh_generic_type of RX_BUFFER_CFG : constant is 1;
    attribute mti_svvh_generic_type of RX_CLK25_DIV : constant is 2;
    attribute mti_svvh_generic_type of RX_CLKMUX_EN : constant is 1;
    attribute mti_svvh_generic_type of RX_CM_SEL : constant is 1;
    attribute mti_svvh_generic_type of RX_CM_TRIM : constant is 1;
    attribute mti_svvh_generic_type of RX_DATA_WIDTH : constant is 2;
    attribute mti_svvh_generic_type of RX_DDI_SEL : constant is 1;
    attribute mti_svvh_generic_type of RX_DEBUG_CFG : constant is 1;
    attribute mti_svvh_generic_type of RX_DEFER_RESET_BUF_EN : constant is 1;
    attribute mti_svvh_generic_type of RX_DISPERR_SEQ_MATCH : constant is 1;
    attribute mti_svvh_generic_type of RX_OS_CFG : constant is 1;
    attribute mti_svvh_generic_type of RX_SIG_VALID_DLY : constant is 2;
    attribute mti_svvh_generic_type of RX_XCLK_SEL : constant is 1;
    attribute mti_svvh_generic_type of SAS_MAX_COM : constant is 2;
    attribute mti_svvh_generic_type of SAS_MIN_COM : constant is 2;
    attribute mti_svvh_generic_type of SATA_BURST_SEQ_LEN : constant is 1;
    attribute mti_svvh_generic_type of SATA_BURST_VAL : constant is 1;
    attribute mti_svvh_generic_type of SATA_EIDLE_VAL : constant is 1;
    attribute mti_svvh_generic_type of SATA_MAX_BURST : constant is 2;
    attribute mti_svvh_generic_type of SATA_MAX_INIT : constant is 2;
    attribute mti_svvh_generic_type of SATA_MAX_WAKE : constant is 2;
    attribute mti_svvh_generic_type of SATA_MIN_BURST : constant is 2;
    attribute mti_svvh_generic_type of SATA_MIN_INIT : constant is 2;
    attribute mti_svvh_generic_type of SATA_MIN_WAKE : constant is 2;
    attribute mti_svvh_generic_type of SATA_PLL_CFG : constant is 1;
    attribute mti_svvh_generic_type of SHOW_REALIGN_COMMA : constant is 1;
    attribute mti_svvh_generic_type of SIM_RECEIVER_DETECT_PASS : constant is 1;
    attribute mti_svvh_generic_type of SIM_RESET_SPEEDUP : constant is 1;
    attribute mti_svvh_generic_type of SIM_TX_EIDLE_DRIVE_LEVEL : constant is 1;
    attribute mti_svvh_generic_type of SIM_VERSION : constant is 1;
    attribute mti_svvh_generic_type of TERM_RCAL_CFG : constant is 1;
    attribute mti_svvh_generic_type of TERM_RCAL_OVRD : constant is 1;
    attribute mti_svvh_generic_type of TRANS_TIME_RATE : constant is 1;
    attribute mti_svvh_generic_type of TST_RSV : constant is 1;
    attribute mti_svvh_generic_type of TXBUF_EN : constant is 1;
    attribute mti_svvh_generic_type of TXBUF_RESET_ON_RATE_CHANGE : constant is 1;
    attribute mti_svvh_generic_type of TXDLY_CFG : constant is 1;
    attribute mti_svvh_generic_type of TXDLY_LCFG : constant is 1;
    attribute mti_svvh_generic_type of TXDLY_TAP_CFG : constant is 1;
    attribute mti_svvh_generic_type of TXGEARBOX_EN : constant is 1;
    attribute mti_svvh_generic_type of TXOOB_CFG : constant is 1;
    attribute mti_svvh_generic_type of TXOUT_DIV : constant is 2;
    attribute mti_svvh_generic_type of TXPCSRESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of TXPHDLY_CFG : constant is 1;
    attribute mti_svvh_generic_type of TXPH_CFG : constant is 1;
    attribute mti_svvh_generic_type of TXPH_MONITOR_SEL : constant is 1;
    attribute mti_svvh_generic_type of TXPI_CFG0 : constant is 1;
    attribute mti_svvh_generic_type of TXPI_CFG1 : constant is 1;
    attribute mti_svvh_generic_type of TXPI_CFG2 : constant is 1;
    attribute mti_svvh_generic_type of TXPI_CFG3 : constant is 1;
    attribute mti_svvh_generic_type of TXPI_CFG4 : constant is 1;
    attribute mti_svvh_generic_type of TXPI_CFG5 : constant is 1;
    attribute mti_svvh_generic_type of TXPI_GREY_SEL : constant is 1;
    attribute mti_svvh_generic_type of TXPI_INVSTROBE_SEL : constant is 1;
    attribute mti_svvh_generic_type of TXPI_PPMCLK_SEL : constant is 1;
    attribute mti_svvh_generic_type of TXPI_PPM_CFG : constant is 1;
    attribute mti_svvh_generic_type of TXPI_SYNFREQ_PPM : constant is 1;
    attribute mti_svvh_generic_type of TXPMARESET_TIME : constant is 1;
    attribute mti_svvh_generic_type of TXSYNC_MULTILANE : constant is 1;
    attribute mti_svvh_generic_type of TXSYNC_OVRD : constant is 1;
    attribute mti_svvh_generic_type of TXSYNC_SKIP_DA : constant is 1;
    attribute mti_svvh_generic_type of TX_CLK25_DIV : constant is 2;
    attribute mti_svvh_generic_type of TX_CLKMUX_EN : constant is 1;
    attribute mti_svvh_generic_type of TX_DATA_WIDTH : constant is 2;
    attribute mti_svvh_generic_type of TX_DEEMPH0 : constant is 1;
    attribute mti_svvh_generic_type of TX_DEEMPH1 : constant is 1;
    attribute mti_svvh_generic_type of TX_DRIVE_MODE : constant is 1;
    attribute mti_svvh_generic_type of TX_EIDLE_ASSERT_DELAY : constant is 1;
    attribute mti_svvh_generic_type of TX_EIDLE_DEASSERT_DELAY : constant is 1;
    attribute mti_svvh_generic_type of TX_LOOPBACK_DRIVE_HIZ : constant is 1;
    attribute mti_svvh_generic_type of TX_MAINCURSOR_SEL : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_FULL_0 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_FULL_1 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_FULL_2 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_FULL_3 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_FULL_4 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_LOW_0 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_LOW_1 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_LOW_2 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_LOW_3 : constant is 1;
    attribute mti_svvh_generic_type of TX_MARGIN_LOW_4 : constant is 1;
    attribute mti_svvh_generic_type of TX_PREDRIVER_MODE : constant is 1;
    attribute mti_svvh_generic_type of TX_RXDETECT_CFG : constant is 1;
    attribute mti_svvh_generic_type of TX_RXDETECT_REF : constant is 1;
    attribute mti_svvh_generic_type of TX_XCLK_SEL : constant is 1;
    attribute mti_svvh_generic_type of UCODEER_CLR : constant is 1;
    attribute mti_svvh_generic_type of USE_PCS_CLK_PHASE_SEL : constant is 1;
end GTPE2_CHANNEL_WRAP;