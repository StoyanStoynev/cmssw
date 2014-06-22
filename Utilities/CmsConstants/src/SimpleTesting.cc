// system include files
#include <memory>

// user include files
#include "FWCore/Framework/interface/Frameworkfwd.h"
#include "FWCore/Framework/interface/EDFilter.h"

#include "FWCore/Framework/interface/Event.h"
#include "FWCore/Framework/interface/MakerMacros.h"

#include "FWCore/ParameterSet/interface/ParameterSet.h"

#include "Utilities/CmsConstants/interface/GeneralUse.h"
#include "Utilities/CmsConstants/interface/DetectorParameters.h"
#include "Utilities/CmsConstants/interface/MassesAndWidths.h"

using namespace std;
//using namespace edm;
//using namespace reco;
//using namespace muon;
//using namespace trigger;


//
// class declaration
//

class SimpleTesting : public edm::EDFilter {
   public:
      explicit SimpleTesting(const edm::ParameterSet&);
      ~SimpleTesting();

      static void fillDescriptions(edm::ConfigurationDescriptions& descriptions);

   private:
      virtual void beginJob() ;
      virtual bool filter(edm::Event&, const edm::EventSetup&);
      virtual void endJob() ;
      
      virtual bool beginRun(edm::Run&, edm::EventSetup const&);
      virtual bool endRun(edm::Run&, edm::EventSetup const&);
      virtual bool beginLuminosityBlock(edm::LuminosityBlock&, edm::EventSetup const&);
      virtual bool endLuminosityBlock(edm::LuminosityBlock&, edm::EventSetup const&);

      // ----------member data ---------------------------
      double testPy_;
};

//
// constants, enums and typedefs
//

//
// static data member definitions
//

//
// constructors and destructor
//
SimpleTesting::SimpleTesting(const edm::ParameterSet& iConfig)
{
   //now do what ever initialization is needed

   testPy_  = iConfig.getUntrackedParameter<double>("testPy");

}


SimpleTesting::~SimpleTesting()
{
 

}


//
// member functions
//

// ------------ method called on each new Event  ------------
bool
SimpleTesting::filter(edm::Event& iEvent, const edm::EventSetup& iSetup)
{
   using namespace edm;
#ifdef THIS_IS_AN_EVENT_EXAMPLE
   Handle<ExampleData> pIn;
   iEvent.getByLabel("example",pIn);
#endif

#ifdef THIS_IS_AN_EVENTSETUP_EXAMPLE
   ESHandle<SetupData> pSetup;
   iSetup.get<SetupRecord>().get(pSetup);
#endif
   cout<<" test python read (double) : "<<testPy_<<endl;
   cout<<" test const header (Det::Muon) etaBarrelEnd = "<<cmsConst::Muon::etaBarrelEnd<<endl;
   cout<<" test const header (General) const sqrt12D = "<<cmsConst::sqrt12D<<endl;
   cout<<" test const header (Mass) CLHEP::e = "<<electron_mass_c2<<" cms::e = "<<cmsConst::massD_E<<endl;
   cout<<" test const header (Mass) massD_H = "<<cmsConst::massD_H<<endl;
	       

   return true;
}

// ------------ method called once each job just before starting event loop  ------------
void 
SimpleTesting::beginJob()
{
}

// ------------ method called once each job just after ending the event loop  ------------
void 
SimpleTesting::endJob() {
}

// ------------ method called when starting to processes a run  ------------
bool 
SimpleTesting::beginRun(edm::Run&, edm::EventSetup const&)
{ 
  return true;
}

// ------------ method called when ending the processing of a run  ------------
bool 
SimpleTesting::endRun(edm::Run&, edm::EventSetup const&)
{
  return true;
}

// ------------ method called when starting to processes a luminosity block  ------------
bool 
SimpleTesting::beginLuminosityBlock(edm::LuminosityBlock&, edm::EventSetup const&)
{
  return true;
}

// ------------ method called when ending the processing of a luminosity block  ------------
bool 
SimpleTesting::endLuminosityBlock(edm::LuminosityBlock&, edm::EventSetup const&)
{
  return true;
}

// ------------ method fills 'descriptions' with the allowed parameters for the module  ------------
void
SimpleTesting::fillDescriptions(edm::ConfigurationDescriptions& descriptions) {
  //The following says we do not know what parameters are allowed so do no validation
  // Please change this to state exactly what you do use, even if it is no parameters
  edm::ParameterSetDescription desc;
  desc.setUnknown();
  descriptions.addDefault(desc);
}
//define this as a plug-in
DEFINE_FWK_MODULE(SimpleTesting);
