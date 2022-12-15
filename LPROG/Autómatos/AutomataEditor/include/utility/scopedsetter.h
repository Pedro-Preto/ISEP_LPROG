#ifndef _SCOPEDSETTER_H_142167890764_
#define _SCOPEDSETTER_H_142167890764_

/*!
 * ScopedSetter sets value to given variable and when goes
 * out of scope, reset its original state.
 *
 * \b Usage:
 * \code
 * // assume bool member variable m_isSet == true
 * ...
 * std::cout << (m_isSet ? "true" : "false") << std::endl; // print 'true'
 * {     
 *     SCOPED_SETTER(bool, m_isSet, false); // false is required state
 *     std::cout << (m_isSet ? "true" : "false") << std::endl; // print 'false'
 * } // end of scope - return orig state
 * 
 * std::cout << (m_isSet ? "true" : "false") << std::endl; // print 'true'
 * \endcode
 *
 * \author Milan Kriz (krizm7@fel.cvut.cz, milan.kriz@centrum.cz)
 */
template <typename T>
class ScopedSetter
{
public:
    ScopedSetter(T &variable, const T &value)
    :   m_variable(variable),
        m_origValue(variable)
    {
        m_variable = value;
    }
    
    ~ScopedSetter()
    {
        m_variable = m_origValue;
    }
    
private:
    T   &m_variable;
    T   m_origValue;
};

#endif //_SCOPEDSETTER_H_142167890764_
