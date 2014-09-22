#include "PhysicsTools/PatUtils/plugins/ShiftedJetProducerByMatchedObject.h"

#include "DataFormats/ParticleFlowCandidate/interface/PFCandidate.h"
#include "DataFormats/ParticleFlowCandidate/interface/PFCandidateFwd.h"
#include "DataFormats/Common/interface/Handle.h"
#include "DataFormats/Common/interface/View.h"
#include "DataFormats/Math/interface/deltaR.h"

template <typename T>
ShiftedJetProducerByMatchedObjectT<T>::ShiftedJetProducerByMatchedObjectT(const edm::ParameterSet& cfg)
  : moduleLabel_(cfg.getParameter<std::string>("@module_label"))
{
  srcJets_ = consumes<JetCollection>(cfg.getParameter<edm::InputTag>("srcJets"));
  srcUnshiftedObjects_ = consumes<edm::View<reco::Candidate> >(cfg.getParameter<edm::InputTag>("srcUnshiftedObjects"));
  srcShiftedObjects_ = consumes<edm::View<reco::Candidate> >(cfg.getParameter<edm::InputTag>("srcShiftedObjects"));

  dRmatch_Jet_ = cfg.getParameter<double>("dRmatch_Jet");
  dRmatch_Object_ = cfg.exists("dRmatch_Object") ?
    cfg.getParameter<double>("dRmatch_Object") : 0.1;

  dR2match_Jet_ = dRmatch_Jet_*dRmatch_Jet_;
  dR2match_Object_ = dRmatch_Object_*dRmatch_Object_;

  produces<JetCollection>();
}

template <typename T>
ShiftedJetProducerByMatchedObjectT<T>::~ShiftedJetProducerByMatchedObjectT()
{
// nothing to be done yet...
}

template <typename T>
void ShiftedJetProducerByMatchedObjectT<T>::produce(edm::Event& evt, const edm::EventSetup& es)
{
  edm::Handle<JetCollection> originalJets;
  evt.getByToken(srcJets_, originalJets);

  typedef edm::View<reco::Candidate> CandidateView;

  edm::Handle<CandidateView> unshiftedObjects;
  evt.getByToken(srcUnshiftedObjects_, unshiftedObjects);

  edm::Handle<CandidateView> shiftedObjects;
  evt.getByToken(srcShiftedObjects_, shiftedObjects);

  objects_.clear();
  
  for ( CandidateView::const_iterator unshiftedObject = unshiftedObjects->begin();
	unshiftedObject != unshiftedObjects->end(); ++unshiftedObject ) {
    bool isMatched_Object = false;
    double dR2bestMatch_Object = std::numeric_limits<double>::max();
    reco::Candidate::LorentzVector shiftedObjectP4_matched;
    for ( CandidateView::const_iterator shiftedObject = shiftedObjects->begin();
	shiftedObject != shiftedObjects->end(); ++shiftedObject ) {
      double dR2 = deltaR2(unshiftedObject->p4(), shiftedObject->p4());
      if ( dR2 < dR2match_Object_ && dR2 < dR2bestMatch_Object ) {
	shiftedObjectP4_matched = shiftedObject->p4();
	isMatched_Object = true;
	dR2bestMatch_Object = dR2;
      }
    }
    if ( isMatched_Object ) {
      objects_.push_back(objectEntryType(shiftedObjectP4_matched, unshiftedObject->p4(), sqrt(dR2bestMatch_Object)));
    }
  }
 
  std::auto_ptr<JetCollection> shiftedJets(new JetCollection);
    
  for ( typename JetCollection::const_iterator originalJet = originalJets->begin();
	originalJet != originalJets->end(); ++originalJet ) {
    
    double shift = 0.;
    bool applyShift = false;
    double dR2bestMatch_Jet = std::numeric_limits<double>::max();
    for ( typename std::vector<objectEntryType>::const_iterator object = objects_.begin();
	  object != objects_.end(); ++object ) {
      if ( !object->isValidMatch_ ) continue;
      double dR2 = deltaR2(originalJet->p4(), object->unshiftedObjectP4_);
      if ( dR2 < dR2match_Jet_ && dR2 < dR2bestMatch_Jet ) {
	shift = object->shift_;
	applyShift = true;
	dR2bestMatch_Jet = dR2;
      }
    }
    
    reco::Candidate::LorentzVector shiftedJetP4 = originalJet->p4();
    if ( applyShift ) {
      shiftedJetP4 *= (1. + shift);
    }
    
    T shiftedJet(*originalJet);      
    shiftedJet.setP4(shiftedJetP4);
    
    shiftedJets->push_back(shiftedJet);
  }
  
  evt.put(shiftedJets);
}

#include "DataFormats/JetReco/interface/CaloJet.h"
#include "DataFormats/JetReco/interface/PFJet.h"

typedef ShiftedJetProducerByMatchedObjectT<reco::CaloJet> ShiftedCaloJetProducerByMatchedObject;
typedef ShiftedJetProducerByMatchedObjectT<reco::PFJet> ShiftedPFJetProducerByMatchedObject;

#include "FWCore/Framework/interface/MakerMacros.h"

DEFINE_FWK_MODULE(ShiftedCaloJetProducerByMatchedObject);
DEFINE_FWK_MODULE(ShiftedPFJetProducerByMatchedObject);


 
