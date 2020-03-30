package banker.finite.interfaces;

/**
	Interface that can be used for classes generated by `FiniteKeys` macro.

	Note that this is not automatically implemented.
**/
interface WritableFiniteKeysMap<K, V> extends FiniteKeysMap<K, V> {
	/**
		Sets `value` for `key`.
	**/
	function set(key: K, value: V): V;

	/**
		Creates a function that sets the value for `key`.
	**/
	function setter(key: K): (value: V) -> Void;
}
