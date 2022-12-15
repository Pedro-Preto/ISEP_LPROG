#ifndef _IALGORITHM_H_4648117994131_
#define _IALGORITHM_H_4648117994131_

#include "iautomaton.h"

#include <QSharedPointer>
#include <QRect>

class IAlgorithm
{
public:
// types
    typedef QList<QSharedPointer<IAlgorithm> > TAlgorithmList;

    virtual ~IAlgorithm() {}

    //! Algorithm can implement own IAutomaton, IState and ITransition classes,
    //! in that case doesn't require creator to be set
    virtual bool requireCreator() const = 0;
    virtual void setAutomataCreator(const QSharedPointer<IAutomataCreator> &creator) = 0;    

    virtual bool hasSettingsDialog() const = 0;
    virtual void runSettingsDialog(QWidget *parent = NULL) = 0;

    virtual QString getName() const = 0;
    
    virtual int getInputCount() const = 0;
    
    virtual bool run(const IAutomaton::TAutomataList &input,
                     QSharedPointer<IAutomaton> &result,
                     QString *report = 0) const = 0;
};

class IAlgorithmHolder
{
public:
    virtual ~IAlgorithmHolder() {}
    
    virtual IAlgorithm::TAlgorithmList getAlgorithms() const = 0;

    //! Returns version of AutomataEditor for which algorithms are implemented, tested ...
    virtual QString getVersion() const = 0;
    
    //! Returns plugin name
    virtual QString getPluginName() const = 0;
};

Q_DECLARE_INTERFACE(IAlgorithmHolder, "AutomataEditor/IAlgorithmHolder/2.0");

#endif //_IALGORITHM_H_4648117994131_
