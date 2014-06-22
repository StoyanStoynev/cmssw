import FWCore.ParameterSet.Config as cms

process = cms.Process("TEST")

process.load('Configuration.StandardSequences.Services_cff')
process.load('Configuration.EventContent.EventContent_cff')
#process.load('Configuration.StandardSequences.MagneticField_AutoFromDBCurrent_cff')
process.load('Configuration/StandardSequences/MagneticField_38T_cff')
process.load('Configuration.Geometry.GeometryIdeal_cff')

process.maxEvents = cms.untracked.PSet(
    input = cms.untracked.int32(1)
)


process.source = cms.Source("PoolSource",
                            fileNames = cms.untracked.vstring(
#  '/store/data/Run2012D/DoubleMuParked/AOD/22Jan2013-v1/20000/002E1374-5F84-E211-83C4-20CF305616D0.root'
'/store/mc/Summer12_DR53X/DYToMuMu_M-20_CT10_TuneZ2star_v2_8TeV-powheg-pythia6/AODSIM/PU_S10_START53_V7A-v1/00003/BEB84C63-9514-E211-AED6-00259073E514.root'
)
)
process.load("Configuration.StandardSequences.FrontierConditions_GlobalTag_cff")
process.GlobalTag.globaltag = 'FT_53_V6_AN1::All'
#from Configuration.AlCa.GlobalTag import GlobalTag
#process.GlobalTag = GlobalTag(process.GlobalTag, 'auto:com10_GRun', '')

from  Utilities.CmsConstants.TrackerConstants_cff import CONST__N_SIGMA
process.simpletest = cms.EDFilter( "SimpleTesting",
  testPy = cms.untracked.double(CONST__N_SIGMA)
)
process.p = cms.Path(process.simpletest)
