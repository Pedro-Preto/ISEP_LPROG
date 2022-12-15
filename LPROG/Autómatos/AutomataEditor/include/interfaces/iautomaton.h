#ifndef _IAUTOMATON_H_414567883019_
#define _IAUTOMATON_H_414567883019_

#include "itransition.h"
#include "istate.h"

#include <QSharedPointer>
#include <QPointF>

/*!
 * Transition table single row interface.
 */
class ITTRow
{
public:
    virtual ~ITTRow() {}

    virtual const QStringList head() const = 0;
    virtual const QStringList getValue(const QString &character) const = 0;
    
    virtual QStringList& operator[](const QString &character) = 0;

    virtual QList<QString> getUniqueKeys() const = 0;
    
    virtual void setInitialFlag(bool inital) = 0;
    virtual void setFinalFlag(bool final) = 0;
    
    virtual bool initialFlag() const = 0;
    virtual bool finalFlag() const = 0;
};


/*!
 * Transition table for make algorithm work easier. 
 */
class ITransitionTable
{
public:
    virtual ~ITransitionTable() {}

    virtual int getRowCount() const = 0;

    virtual QSharedPointer<ITTRow> getRow(int idx) const = 0;

    virtual int addRow(const QSharedPointer<ITTRow> &row) = 0;

    virtual QList<QString> getUniqueKeys() const = 0;

    virtual QString toLaTeXTable() const = 0;
    virtual QString toStringTable() const = 0;
};



/*!
 * Interface of finite automaton, which is provided to algorithms for 
 * operations with finite automata.
 */
class IAutomaton
{
public:
    // types
    typedef QList<QSharedPointer<IAutomaton> >  TAutomataList;
    typedef QMap<QString, QPointF>              TPositioningMap;

    virtual ~IAutomaton(){}
    
    virtual IState::TIStateList getStates() const = 0;
    virtual IState::TIStateList getInitialStates() const = 0;
    virtual IState::TIStateList getFinalStates() const = 0;
    
    virtual IState::TIStateNameList getStateNameList() const = 0;

    virtual ITransition::TITransitionList getTransitions() const = 0;

    virtual QSharedPointer<ITransitionTable> getTransitionTable() const = 0;

    virtual void setAlphabet(const ITransition::TCharSet &alphabet) = 0;
    virtual void setAlphabetSymbol(const QString &alphabetSymbol) = 0;
    virtual void setEpsilonSymbol(const QString &epsilonSymbol) = 0;
    
    virtual ITransition::TCharSet getAlphabet() const = 0;
    virtual QString getAlphabetSymbol() const = 0;
    virtual QString getEpsilonSymbol() const = 0;

    virtual QSharedPointer<IState> getState(const QString &name) const = 0;    
    virtual bool removeState(const QSharedPointer<IState> &state) = 0;
    virtual bool removeState(const QString &stateName) = 0;
    
    virtual bool removeTransition(const QSharedPointer<ITransition> &tr) = 0;

    //! Renames state and effects changed on transitions
    virtual bool renameState(const QSharedPointer<IState> &state, const QString &newName) = 0;

    //! Creates and adds state to automaton (returns NULL if failed)
    virtual QSharedPointer<IState> createState
        (const QString &name, const QString &label, bool initial, bool final) = 0;
    
    //! If returns true, no transitions with the same characters between the same states are allowed.
    //! In that case, automaton automatically merges created transitions in the way,
    //! that there can be maximally two transition's instances for each pair of states in automaton.
    //! One of them is reserved for epsilon transition, the second is for other characters.
    virtual bool allowRedundantTransitions() const = 0;
    //! Sets whether automaton should allow redundant transitions or not.
    virtual void setAllowRedundantTransitions(bool allow) = 0;

    //! Creates and adds transition to automaton (returns NULL if failed).
    //! If transitions with same parameters currently exists, is silently returned as if it has been already created.
    //! \sa allowRedundantTransitions
    virtual QSharedPointer<ITransition> createTransition
        (const QString &source, const QString &dest, const ITransition::TCharSet &characters) = 0;
	
	//! \name Methods giving informations about automaton
	//! \{
	virtual bool hasMultipleInitials() const = 0;
	virtual bool hasEpsilonTransitions() const = 0;
	virtual bool isDeterministic() const = 0;
	
	virtual bool hasState(const QString &name) const = 0;
	virtual ITransition::TCharSet getTransitionSymbols(const QString &source, const QString &dest) const = 0;
	//! \}
	
	//! \name Positioning methods
	//! \{
	//! Returns true if positions are set, otherwise returns false
	virtual bool hasPositions() const = 0;
	//! Returns	positioning map
	virtual TPositioningMap getPositioningMap() const = 0;
	//! Sets map with positions of states
	virtual void setPositioningMap(const TPositioningMap &map) = 0;
	//! \}
	
	//! \name Simulation support methods
	//! \{	
	//! Sets initial states as active
	virtual void reset() = 0;
	//! Process input character
	virtual bool processCharacter(const QString &character) = 0;
	//! Returns true if current configuration is ACCEPTed
	virtual bool isConfigurationAccepted() const = 0;
	//! Returns currently active states
	virtual IState::TIStateList getActiveStates() const = 0;
	//! Returns active states names in QStringList
	virtual QStringList getActiveStatesNames() const = 0;
	//! Returns currently accepted string (nothing after reset())
	virtual QStringList getProcessedString() const = 0;
	//! \}
};



/*!
 * Interface of AutomataCreator which is provided by editor. Plugins can require creator 
 * to create IAutomaton, IState and ITransition w/o own implementation of these interfaces.
 */
class IAutomataCreator
{
public:
    virtual ~IAutomataCreator() {}

    // TODO: should be alphabet sorted?
    virtual QSharedPointer<IAutomaton>  createAutomaton(const ITransition::TCharSet &alphabet, 
                                                        const QString &alphabetSymbol,
                                                        const QString &epsilonSymbol) = 0;
    
    // TODO: implement this?
    //virtual QSharedPointer<IAutomaton>  createAutomaton(const ITransitionTable &transitionTable) = 0;
};


#endif //_IAUTOMATON_H_414567883019_
