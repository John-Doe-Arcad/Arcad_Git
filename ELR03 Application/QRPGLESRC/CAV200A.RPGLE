000100170411      *-------------------------------------------------------------*
000200170412      *  calculation of the cost price                              *
000300991203      *-------------------------------------------------------------*
000400170411      * Files
000500170411     Fentcdep1  IF   E           K DISK
000600170413     Fdetcdep1  UF   E           K DISK
000800170411      *
001100170411      * Keys
001200170410     c     kcmd          klist
001300170410     c                   kfld                    soci
001400170410     c                   kfld                    etab
001500170410     c                   kfld                    numi
001501170411      *------------------------------------------------------------
001502170412      *                 processing
001503170411      *------------------------------------------------------------
001600170412      * Order header
001700170411     c                   read      entcdep1
001800170411     c                   dow       not %eof(entcdep1)
001900170412      * order lines
002000170411     c     kcmd          setll     detcdep1
002001170411     c
002100170411     c     kcmd          reade     detcdep1
002200170411     c                   dow       not %eof(detcdep1)
002300170410
002400170410     c                   if        ccrtpc = 'C'
002500170410     c                   eval      PXRV = (CCPXTA - CCPXTR) * CCQTFC
002600170410     c                   else
002700170410     c                   if        ccrtpc = 'P'
002800170410     c                   eval      PXRV = (CCPXTA * CCRPCR) * CCQTFC
002900170410     c                   else
003000170410     c                   eval      PXRV = PXAN
003100170410     c                   endif
003200170410     c                   endif
003300170413     c                   update    orc002f1
003400170410
003500170411     c     kcmd          reade     detcdep1
003600170410     c                   enddo
003700170410      *
003800170411     c                   read      entcdep1
003900170410     c                   enddo
004000170410      *
004100170410     c                   move      '1'           *INLR
004200010919      *.............................................................*
